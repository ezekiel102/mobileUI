//
//  SplashScreen.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        GeometryReader { geometry in
//            ZStack() {
            Color.paleGrey
                .ignoresSafeArea()
            Image("logo")
                .frame(width: 247, height: 74)
                .position(x: geometry.size.width / 2 + 10,
                          y: geometry.size.height / 2 - 136.5)
            ProgressView(value: 0.5)
                .frame(width: 36, height: 36)
                .progressViewStyle(.circular)
                .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 2 + 41.5)
            Text("Загрузка...")
                .font(.textStyle6)
                .frame(width: 68, height: 15)
                .position(x: geometry.size.width / 2 + 12.5,
                          y: geometry.size.height / 2 + 87)
            Image("simbirSoft")
                .frame(width: 116, height: 15.5)
                .position(x: geometry.size.width / 2 - 7.5,
                          y: geometry.size.height - 56.25)
//            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
