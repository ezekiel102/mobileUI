//
//  NewsView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct NewsView: View {

    @EnvironmentObject var viewModel: ViewModel

    let newsTabBarView: MainTabBarNavigation = .news

    var body: some View {
        NavigationStack {
            VStack(
                spacing: UICons.zeroSpacingForStack,
                content: {
                    NavigationBar(title: newsTabBarView.name, action: { exit(1) })
                    ZStack {
                        Color.blue
                    }
                })
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
