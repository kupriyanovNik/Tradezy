//
//  TradezyApp.swift
//  Tradezy
//

import SwiftUI

@main
struct TradezyApp: App {

    // MARK: - Property Wrappers

    @StateObject private var navigationManager = NavigationManager()

    // MARK: - Body 

    var body: some Scene {
        WindowGroup {
            MainNavigationView(
                navigationManager: navigationManager
            )
        }
    }
}
