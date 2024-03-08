//
//  HistoryView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct HistoryView: View {

    @EnvironmentObject var viewModel: ViewModel

    let historyTabBarView: MainTabBarNavigation = .history

    var body: some View {
        NavigationStack {
            VStack(
                spacing: UICons.zeroSpacingForStack,
                content: {
                    NavigationBar(title: historyTabBarView.name, action: { exit(1) })
                    ZStack {
                        Color.yellow
                    }
                })
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
