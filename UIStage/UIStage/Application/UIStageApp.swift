//
//  UIStageApp.swift
//  UIStage
//
//  Created by Рустем on 23.02.2024.
//

import SwiftUI

@main
struct UIStageApp: App {

    @StateObject private var viewModel = ViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
