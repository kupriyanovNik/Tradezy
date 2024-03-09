//
//  HomeView.swift
//  Tradezy
//

import SwiftUI

struct HomeView: View {

    // MARK: - Property Wrappers

    @ObservedObject var navigationManager: NavigationManager

    @State private var showThemePicker: Bool = false 

    // MARK: - Body

    var body: some View {
        Button {
            navigationManager.presentNext(.newScreen)
        } label: {
            Text("Push")
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showThemePicker.toggle()
                } label: {
                    Image(systemName: "moonphase.waxing.gibbous.inverse")
                }
            }
        }
        .sheet(isPresented: $showThemePicker) {
            ThemePickerView()
                .presentationDetents([.height(400)])
                .presentationBackground(.clear)
        }
    }
}

// MARK: - Preview

#Preview {
    HomeView(
        navigationManager: .init()
    )
}
