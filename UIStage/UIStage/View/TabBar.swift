//
//  TabBar.swift
//  UIStage
//
//  Created by Рустем on 01.03.2024.
//

import SwiftUI

struct TabBar: View {

    @ObservedObject var viewModel: ViewModel
    @State var currentTabBarView: TabBarNavigation = .help

    var body: some View {
        VStack(spacing: UICons.zeroSpacingForVStack) {
            currentTabBarView.changeView(viewModel: viewModel)
            tabBar
        }
    }

    var tabBar: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(edges: .bottom)
                .shadow(color: .black20, radius: 2.0, x: 0.0, y: -1.0)
                .frame(height: UICons.tabBarHeight)
                .overlay {
                    Arc()
                        .fill(Color.white)
                        .shadow(color: .whiteTwo, radius: 0.0, x: 0.0, y: -2.0)
                }
            HStack(alignment: .bottom) {
                ForEach(TabBarNavigation.allCases, id: \.self) { item in
                    TabItem(tabBarNavigation: item, currentTabBarView: $currentTabBarView)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct TabItem: View {

    let tabBarNavigation: TabBarNavigation

    @Binding var currentTabBarView: TabBarNavigation

    var body: some View {
        Button {
            currentTabBarView = tabBarNavigation
        } label: {
            if tabBarNavigation != TabBarNavigation.help {
                tabBarItem
            } else {
                helpButton
            }
        }
    }

    var tabBarItem: some View {
        ZStack {
            VStack {
                Image(systemName: tabBarNavigation.imageName)
                    .font(.textStyle22)
                    .foregroundColor(
                        currentTabBarView != tabBarNavigation ?
                            .warmGrey : .accentColor)
                    .padding(.top, UICons.topPaddingBarImage)
                Spacer()
            }
            VStack {
                Spacer()
                Text(tabBarNavigation.name)
                    .font(.textStyle14)
                    .foregroundColor(
                        currentTabBarView != tabBarNavigation ?
                            .warmGrey : .accentColor)
                    .padding(.bottom, UICons.bottomPaddingBarText)
            }
        }
    }

    var helpButton: some View {
        ZStack {
            Circle()
                .frame(width: UICons.circleDiametr,
                       height: UICons.circleDiametr)
                .foregroundColor(
                    currentTabBarView != tabBarNavigation ?
                        .white : .accentColor)
                .shadow(color: .leaf, radius: 2.0, x: 0.0, y: 0.0)
                .overlay {
                    Image(systemName: tabBarNavigation.imageName)
                        .font(.textStyle8)
                        .foregroundColor(
                            currentTabBarView != tabBarNavigation ?
                                .leaf : .white)
                }
                .offset(x: 0, y: UICons.helpButtonOffset)
            VStack {
                Spacer()
                Text(tabBarNavigation.name)
                    .font(.textStyle14)
                    .foregroundColor(
                        currentTabBarView != tabBarNavigation ?
                            .warmGrey : .accentColor)
                    .padding(.bottom, UICons.bottomPaddingBarText)
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(viewModel: ViewModel())
    }
}
