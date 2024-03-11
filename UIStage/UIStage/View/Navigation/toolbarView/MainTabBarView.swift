//
//  MainTabBarView.swift
//  UIStage
//
//  Created by Рустем on 06.03.2024.
//

import SwiftUI

struct MainTabBarView: View {

    @EnvironmentObject var viewCoordinator: ViewCoordinator

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(edges: .bottom)
                .shadow(color: .black20, radius: 2.0, x: 0.0, y: -1.0)
                .overlay {
                    Arc()
                        .fill(Color.white)
                        .shadow(color: .whiteTwo, radius: 0.0, x: 0.0, y: -2.0)
                }
            HStack(alignment: .bottom) {
                ForEach(MainTabBarNavigation.allCases, id: \.self) { item in
                    MainTabItem(currentView: $viewCoordinator.currentMainView,
                                tabBarNavigation: item)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .frame(height: UICons.tabBarHeight)
    }
}

struct MainTabItem: View {

    @Binding var currentView: MainTabBarNavigation

    let tabBarNavigation: MainTabBarNavigation

    var body: some View {
        Button {
            currentView = tabBarNavigation
        } label: {
            if tabBarNavigation != MainTabBarNavigation.help {
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
                        currentView != tabBarNavigation ?
                            .warmGrey : .accentColor)
                    .padding(.top, UICons.topPaddingBarImage)
                Spacer()
            }
            VStack {
                Spacer()
                Text(tabBarNavigation.name)
                    .font(.textStyle14)
                    .foregroundColor(
                        currentView != tabBarNavigation ?
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
                    currentView != tabBarNavigation ?
                        .white : .accentColor)
                .shadow(color: .leaf, radius: 2.0, x: 0.0, y: 0.0)
                .overlay {
                    Image(systemName: tabBarNavigation.imageName)
                        .font(.textStyle8)
                        .foregroundColor(
                            currentView != tabBarNavigation ?
                                .leaf : .white)
                }
                .offset(x: 0, y: UICons.helpButtonOffset)
            VStack {
                Spacer()
                Text(tabBarNavigation.name)
                    .font(.textStyle14)
                    .foregroundColor(
                        currentView != tabBarNavigation ?
                            .warmGrey : .accentColor)
                    .padding(.bottom, UICons.bottomPaddingBarText)
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {

    static let viewCoordinator = ViewCoordinator()

    static var previews: some View {
        MainTabBarView()
            .environmentObject(viewCoordinator)
    }
}
