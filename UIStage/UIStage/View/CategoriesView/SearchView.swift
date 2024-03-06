//
//  SearchView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct SearchView: View {

    @EnvironmentObject var viewModel: ViewModel

    let searchTabBarView: MainTabBarNavigation = .search

    var body: some View {
        NavigationStack {
            VStack(
                spacing: UICons.zeroSpacingForStack,
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
        SearchView()
    }
}
