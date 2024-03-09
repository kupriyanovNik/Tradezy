//
//  ThemePickerView.swift
//  Tradezy
//

import SwiftUI

struct ThemePickerView: View {

    // MARK: - Property Wrappers

    @Environment(\.colorScheme) var colorScheme
    @AppStorage("selectedTheme") var selectedTheme: ThemeDefinition = .system
    @Namespace var animation

    // MARK: - Body

    var body: some View {
        VStack(spacing: 15) {
            Circle()
                .fill(selectedTheme.color(colorScheme).gradient)
                .frame(width: 150, height: 150)

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
    }
}

// MARK: - Preview

#Preview {
    ThemePickerView()
}
