//
//  NavigationBar.swift
//  UIStage
//
//  Created by Рустем on 01.03.2024.
//

import SwiftUI

struct NavigationBar: View {

    let title: String
    var action: () -> Void

    var body: some View {
            ZStack {
                Color.leaf
                    .ignoresSafeArea()
                ZStack {
                    HStack {
                        Button {
                            action()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.textStyle22)
                                .foregroundColor(.white)
                                .padding(.leading, UICons.leadingPaddingBackButton)
                        }
                        Spacer()
                    }
                    Text(title)
                        .font(.textStyle22)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .frame(width: UICons.navigationTitleFrameWidth)

                }
            }
            .frame(height: UICons.navigationBarFrameHeight)
            .shadow(color: Color(white: 0.0, opacity: 0.1), radius: 2.0, x: 0.0, y: 2.0)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Помочь", action: { print(1) })
    }
}
