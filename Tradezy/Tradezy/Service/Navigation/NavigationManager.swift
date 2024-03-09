//
//  NavigationManager.swift
//  Tradezy
//

import Foundation

final class NavigationManager: ObservableObject {

    // MARK: - Property Wrappers

    @Published var navPath: [NavigationDestinationType] = []
}
