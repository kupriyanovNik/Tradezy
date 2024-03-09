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
        Text("Hello, World!")
    }
}

// MARK: - Preview 

#Preview {
    HomeView(
        navigationManager: .init()
    )
}
