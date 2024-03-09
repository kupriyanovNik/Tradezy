//
//  ThemeDefinition.swift
//  Tradezy
//

import SwiftUI

enum ThemeDefinition: String, CaseIterable {
    case system = "Системная"
    case light = "Светлая"
    case dark = "Темная"

    func color(_ scheme: ColorScheme) -> Color {
        switch self {
        case .system: scheme == .dark ? .moon : .sun
        case .light: .sun
        case .dark: .moon
        }
    }
}
