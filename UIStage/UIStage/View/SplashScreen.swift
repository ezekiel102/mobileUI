//
//  SplashScreen.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color.paleGrey
                .ignoresSafeArea()
            VStack(spacing: UICons.zeroSpacingForStack) {
                Spacer()
                Image("logo")
                    .resizable()
                    .aspectRatio(UICons.logoAspectRatio,
                                 contentMode: .fit)
                    .padding(.horizontal, UICons.logoHorizontalPadding)
                VStack(spacing: UICons.loadingVStackSpacing) {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                    Text("Загрузка...")
                        .font(.textStyle6)
                }
                .padding(.top, UICons.topPaddingLogoActivityIndicator)
                Spacer()
                Image("simbirSoft")
                    .resizable()
                    .aspectRatio(UICons.simbirSoftAspectRatio,
                                 contentMode: .fit)
                    .frame(maxHeight: UICons.simbirSoftFrameHeight)
                    .padding(.horizontal, UICons.simbirSoftHorizontalPadding)
                    .padding(.bottom, UICons.simbirSoftBottomPadding)
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
