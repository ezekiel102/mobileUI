//
//  ProfileView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct ProfileView: View {

    @EnvironmentObject var viewModel: ViewModel

    let profileTabBarView: MainTabBarNavigation = .profile

    var body: some View {
        NavigationStack {
            VStack(
                spacing: UICons.zeroSpacingForStack,
                content: {
                    NavigationBar(title: profileTabBarView.name, action: { exit(1) })
                    ZStack {
                        Color.purple
                    }
                })
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
