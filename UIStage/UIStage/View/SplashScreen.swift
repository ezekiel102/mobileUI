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
            Color.paleGrey
                .ignoresSafeArea()
            Image("logo")
                .resizable()
                .frame(maxWidth: UICons.logoMaxWidth, maxHeight: UICons.logoMaxHeight)
                .frame(width: geometry.size.width - UICons.logoDeltaWidth,
                       height: (geometry.size.width - UICons.logoDeltaWidth) * UICons.logoAsceptRatio)
                .position(x: geometry.size.width / 2 + UICons.logoDeltaCenterX,
                          y: geometry.size.height / 2 + UICons.logoDeltaCenterY)
            ProgressView()
                .frame(width: UICons.activityIndicatorFrameSize,
                       height: UICons.activityIndicatorFrameSize)
                .progressViewStyle(.circular)
                .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 2 + UICons.activityIndicatorDeltaCenterY)
            Text("Загрузка...")
                .font(.textStyle6)
                .frame(width: UICons.loadingFrameWidth,
                       height: UICons.loadingFrameHeight)
                .position(x: geometry.size.width / 2 + UICons.loadingDeltaCenterX,
                          y: geometry.size.height / 2 +
                          UICons.activityIndicatorDeltaCenterY + UICons.loadingDeltaCenterYFromAI)
            Image("simbirSoft")
                .frame(width: UICons.simbirSoftFrameWidth,
                       height: UICons.simbirSoftFrameHeight)
                .position(x: geometry.size.width / 2 + UICons.simbirSoftDeltaCenterX,
                          y: geometry.size.height + UICons.simbirSoftDeltaCenterY)
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
