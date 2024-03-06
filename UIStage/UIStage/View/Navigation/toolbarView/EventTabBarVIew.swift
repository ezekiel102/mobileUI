//
//  EventTabBarView.swift
//  UIStage
//
//  Created by Рустем on 06.03.2024.
//

import SwiftUI

struct EventTabBarView: View {
    var body: some View {
        ZStack {
            HStack(spacing: UICons.zeroSpacingForStack) {
                ForEach(EventTabBarNavigation.allCases, id: \.self) { item in
                    Button {
                    } label: {
                        VStack {
                            Image(item.imageName)
                            Text(item.name)
                                .foregroundColor(.warmGrey)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .font(.textStyle16)
            HStack(spacing: UICons.zeroSpacingForStack) {
                Spacer()
                Divider()
                Spacer()
                Divider()
                Spacer()
                Divider()
                Spacer()
            }
            .frame(height: 35)
        }
        .frame(height: 69)
        .background {
            Color.offWhite
                .ignoresSafeArea()
        }
        .shadow(color: .black20, radius: 2.0, x: 0.0, y: 0.0)
    }
}

struct EventTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        EventTabBarView()
    }
}
