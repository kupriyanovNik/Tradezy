//
//  HomeView.swift
//  Tradezy
//

import SwiftUI

struct HomeView: View {

    // MARK: - Property Wrappers

    @ObservedObject var navigationManager: NavigationManager

    // MARK: - Body

    var body: some View {
        Button {
            navigationManager.navPath.append(.newScreen)
        } label: {
            Text("Push")
        }
    }
}

// MARK: - Preview

#Preview {
    HomeView(
        navigationManager: .init()
    )
}
