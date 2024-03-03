//
//  ContentView.swift
//  UIStage
//
//  Created by Рустем on 23.02.2024.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: ViewModel
    @State var showSplashScreen = true

    var body: some View {
            if showSplashScreen {
                SplashScreen()
                    .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                                showSplashScreen = false
                            }
                        }
            } else {
                TabBar(viewModel: viewModel)
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
