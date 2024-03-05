//
//  NewsView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct NewsView: View {

    let newsTabBarView: TabBarNavigation = .news
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationStack {
            VStack(
                spacing: UICons.zeroSpacingForVStack,
                content: {
                    NavigationBar(category: newsTabBarView.name, action: { exit(1) })
                    ZStack {
                        Color.blue
                    }
                })
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(viewModel: ViewModel())
    }
}
