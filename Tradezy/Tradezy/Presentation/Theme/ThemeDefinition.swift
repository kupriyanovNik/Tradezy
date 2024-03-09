//
//  ThemeDefinition.swift
//  Tradezy
//

import SwiftUI

enum ThemeDefinition: String, CaseIterable {
    case system = "Системная"
    case light = "Светлая"
    case dark = "Темная"

    var colorScheme: ColorScheme? {
        switch self {
        case .system: nil
        case .light: .light
        case .dark: .dark
        }
    }

    func color(_ scheme: ColorScheme) -> Color {
        switch self {
        case .system: scheme == .dark ? .moon : .sun
        case .light: .sun
        case .dark: .moon
        }
    }
}
