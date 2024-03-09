//
//  View+Ext.swift
//  Tradezy
//

import SwiftUI

extension View {
    func hLeading() -> some View {
        frame(maxWidth: .infinity, alignment: .leading)
    }

    func hTrailing() -> some View {
        frame(maxWidth: .infinity, alignment: .trailing)
    }

    func hCenter() -> some View {
        frame(maxWidth: .infinity, alignment: .center)
    }
}

extension View {
    func vTop() -> some View {
        frame(maxHeight: .infinity, alignment: .top)
    }

    func vCenter() -> some View {
        frame(maxHeight: .infinity, alignment: .center)
    }

    func vBottom() -> some View {
        frame(maxHeight: .infinity, alignment: .bottom)
    }
}
