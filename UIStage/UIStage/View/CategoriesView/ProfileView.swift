//
//  ProfileView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct ProfileView: View {

    let profileTabBarView: TabBarNavigation = .news
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationStack {
            VStack(
                spacing: UICons.zeroSpacingForVStack,
                content: {
                    NavigationBar(category: profileTabBarView.name, action: { exit(1) })
                    ZStack {
                        Color.purple
                    }
                })
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ViewModel())
    }
}
