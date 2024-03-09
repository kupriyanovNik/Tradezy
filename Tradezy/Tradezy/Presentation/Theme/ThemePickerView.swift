//
//  ThemePickerView.swift
//  Tradezy
//

import SwiftUI

struct ThemePickerView: View {

    // MARK: - Property Wrappers

    @Binding var selectedTheme: ThemeDefinition

    @Namespace var animation

    @State private var circleOffset: CGSize = .zero

    // MARK: - Internal Properties

    var colorScheme: ColorScheme

    // MARK: - Body

    var body: some View {
        VStack(spacing: 15) {
            Circle()
                .fill(selectedTheme.color(colorScheme).gradient)
                .frame(width: 150, height: 150)
                .mask {
                    Rectangle()
                        .overlay {
                            Circle()
                                .offset(circleOffset)
                                .blendMode(.destinationOut)
                        }
                }

            Text("Выберите тему")
                .font(.title2)
                .bold()
                .padding(.top, 25)

            HStack(spacing: 0) {
                ForEach(ThemeDefinition.allCases, id: \.hashValue) { theme in
                    Text(theme.rawValue)
                        .padding(.vertical)
                        .frame(width: 100)
                        .background {
                            ZStack {
                                if selectedTheme == theme {
                                    Capsule()
                                        .fill(.themeBG)
                                        .matchedGeometryEffect(id: "selectedTheme", in: animation)
                                }
                            }
                            .animation(.snappy, value: selectedTheme)
                        }
                        .contentShape(.rect)
                        .onTapGesture {
                            selectedTheme = theme
                        }
                }
            }
            .padding(3)
            .background(.primary.opacity(0.06), in: .capsule)
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(height: 400)
        .background(.themeBG)
        .clipShape(.rect(cornerRadius: 30))
        .padding(.horizontal)
        .environment(\.colorScheme, colorScheme)
        .onAppear(perform: animateCircle)
        .onChange(of: colorScheme, animateCircle)
    }

    // MARK: - Private Functions

    private func animateCircle() {
        let isDark = colorScheme == .dark

        withAnimation(.bouncy) {
            circleOffset = .init(width: isDark ? 30: 150, height: isDark ? -25 : -150)
        }
    }
}

// MARK: - Preview

#Preview {
    ThemePickerView(
        selectedTheme: .constant(.system),
        colorScheme: .light
    )
}
