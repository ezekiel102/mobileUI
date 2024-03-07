//
//  UIStageApp.swift
//  UIStage
//
//  Created by Рустем on 23.02.2024.
//

import SwiftUI

@main
struct UIStageApp: App {

    private let viewModel = ViewModel()
    private let viewCoordinator = ViewCoordinator()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewCoordinator)
                .environmentObject(viewModel)
        }
    }
}
