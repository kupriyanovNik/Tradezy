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
        }
    }
}

// MARK: - Preview

#Preview {
    MainNavigationView(
        navigationManager: .init()
    )
}
