//
//  ContentView.swift
//  UIStage
//
//  Created by Рустем on 23.02.2024.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var viewCoordinator: ViewCoordinator
    @EnvironmentObject var viewModel: ViewModel

    @State var showSplashScreen = true

    var body: some View {
        if showSplashScreen {
            splashScreen
        } else {
            firstView
        }
    }

    var splashScreen: some View {
        SplashScreen()
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 3.0,
                                     repeats: false) { _ in
                    showSplashScreen = false
                }
            }
    }

    var firstView: some View {
        VStack(spacing: UICons.zeroSpacingForStack) {
            viewCoordinator.mainView
            viewCoordinator.tabBarView

        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static let viewModel = ViewModel()
    static let viewCoordinator = ViewCoordinator()

    static var previews: some View {
        ContentView()
            .environmentObject(viewModel)
            .environmentObject(viewCoordinator)
    }
}
