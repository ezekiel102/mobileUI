//
//  NavigationBar.swift
//  UIStage
//
//  Created by Рустем on 01.03.2024.
//

import SwiftUI

struct NavigationBar: View {

    let category: String
    var action: () -> Void

    var body: some View {
        GeometryReader { geometry in
            Color.leaf
            Button {
                action()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                    .font(.system(size: 21))
            }
            .position(x: 26.6, y: geometry.size.height - 18.5)
            Text(category)
                .font(.textStyle22)
                .foregroundColor(.white)
                .position(x: geometry.size.width / 2, y: geometry.size.height - 18.5)
        }
        .frame(height: 64, alignment: .top)
        .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea(edges: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(category: "Помочь", action: { print(1) })
    }
}
