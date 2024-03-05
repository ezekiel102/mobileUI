//
//  HistoryView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct HistoryView: View {

    let historyTabBarView: TabBarNavigation = .news
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationStack {
            VStack(
                spacing: UICons.zeroSpacingForVStack,
                content: {
                    NavigationBar(category: historyTabBarView.name, action: { exit(1) })
                    ZStack {
                        Color.yellow
                    }
                })
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(viewModel: ViewModel())
    }
}
