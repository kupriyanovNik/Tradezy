//
//  NavigationManager.swift
//  Tradezy
//

import Foundation

final class NavigationManager: ObservableObject {

    // MARK: - Property Wrappers

    @Published var navPath: [NavigationDestinationType] = []

    // MARK: - Internal Functions

    func presentNext(_ destination: NavigationDestinationType) {
        navPath.append(destination)
    }

    func presentPrevious() {
        guard navPath.count > 0 else { return }

        navPath.removeLast()
    }

    func presentFirst() {
        navPath.removeAll()
    }

    func remove(_ element: NavigationDestinationType) {
        if let index = navPath.firstIndex(of: element) {
            navPath.remove(at: index)
        }
    }
}
