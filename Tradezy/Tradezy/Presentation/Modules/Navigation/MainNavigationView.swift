//
//  MainNavigationView.swift
//  Tradezy
//

import SwiftUI

struct MainNavigationView: View {

    // MARK: - Property Wrappers

    @ObservedObject var navigationManager: NavigationManager

    // MARK: - Body

    var body: some View {
        NavigationStack(path: $navigationManager.navPath) {
            HomeView(
                navigationManager: navigationManager
            )
            .navigationDestination(for: NavigationDestinationType.self, destination: getDestinationView)
        }
    }

    // MARK: - Private Functions

    private func getDestinationView(destination: NavigationDestinationType) -> some View {
        switch destination {
        default: Text("another view")
        }
    }
}

// MARK: - Preview

#Preview {
    MainNavigationView(
        navigationManager: .init()
    )
}
