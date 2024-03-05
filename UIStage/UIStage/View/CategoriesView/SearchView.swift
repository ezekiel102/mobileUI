//
//  SearchView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct SearchView: View {

    let searchTabBarView: TabBarNavigation = .news
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationStack {
            VStack(
                spacing: UICons.zeroSpacingForVStack,
                content: {
                    NavigationBar(category: searchTabBarView.name, action: { exit(1) })
                    ZStack {
                        Color.green
                    }
                })
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: ViewModel())
    }
}
