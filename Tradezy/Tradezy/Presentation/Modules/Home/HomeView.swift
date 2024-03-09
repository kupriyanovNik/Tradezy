//
//  HomeView.swift
//  Tradezy
//

import SwiftUI

struct HomeView: View {

    // MARK: - Property Wrappers

    @Environment(\.colorScheme) var colorScheme

    @ObservedObject var navigationManager: NavigationManager

    @State private var showThemePicker: Bool = false 
    @AppStorage("selectedTheme") var selectedTheme: ThemeDefinition = .system

    // MARK: - Body

    var body: some View {
        Button {
            navigationManager.presentNext(.newScreen)
        } label: {
            Text("Push")
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showThemePicker.toggle()
                } label: {
                    Image(systemName: "moonphase.waxing.gibbous.inverse")
                }
            }
        }
        .preferredColorScheme(selectedTheme.colorScheme)
        .sheet(isPresented: $showThemePicker) {
            ThemePickerView(colorScheme: colorScheme)
                .presentationDetents([.height(400)])
                .presentationBackground(.clear)
        }
    }
}

// MARK: - Preview

#Preview {
    HomeView(
        navigationManager: .init()
    )
}
