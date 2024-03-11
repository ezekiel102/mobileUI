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
            HStack(spacing: UICons.zeroSpacingForStack) {
                ForEach(0..<3) { _ in
                    Spacer()
                    Divider()
                }
                Spacer()
            }
            .frame(height: UICons.eventDividerHeight)
        }
        .font(.textStyle16)
        .frame(height: UICons.eventTabBarHeight)
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
