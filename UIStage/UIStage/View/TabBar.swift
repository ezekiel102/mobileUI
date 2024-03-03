//
//  TabBar.swift
//  UIStage
//
//  Created by Рустем on 01.03.2024.
//

import SwiftUI

struct TabBar: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack(spacing: 0) {
            viewModel.view
            tabBar
        }
    }

    var tabBar: some View {
        ZStack {
            RectangleStroke()
                .fill(Color.white)
                .shadow(color: .black20, radius: 2.0, x: 0.0, y: 0.0)
                .frame(height: UICons.tabBarHeight)
                .overlay {
                    Arc()
                        .fill(Color.white)
                        .shadow(color: .whiteTwo, radius: 0.0, x: 0.0, y: -1.0)
                }
            HStack(spacing: UICons.spacing / 2) {
                ForEach(TabBarNavigation.allCases, id: \.self) { item in
                    TabItem(viewModel: viewModel, tabBarNavigation: item)
                }
            }
            .frame(height: UICons.tabBarHeight, alignment: .bottom)
            .frame(maxWidth: .infinity, alignment: .bottom)
        }
        .frame(height: UICons.tabBarHeight, alignment: .bottom)
        .frame(alignment: .bottom)
    }
}

struct TabItem: View {

    @ObservedObject var viewModel: ViewModel

    let tabBarNavigation: TabBarNavigation

    var body: some View {
        if tabBarNavigation != TabBarNavigation.help {
            tabBarItem
        } else {
            helpButton
        }
    }

    var tabBarItem: some View {
        Button {
            viewModel.changeTabView(nextView: tabBarNavigation)
        } label: {
            GeometryReader { geometry in
                Image(systemName: tabBarNavigation.imageName)
                    .font(.system(size: 23))
                    .position(x: geometry.size.width / 2,
                              y: UICons.tabItemImageDeltaCenterX)
                    .foregroundColor(
                        viewModel.currentView != tabBarNavigation ?
                            .warmGrey : .accentColor)
                Text(tabBarNavigation.name)
                    .font(.textStyle14)
                    .frame(width: UIScreen.main.bounds.width /
                           UICons.numbersOfTabItems - UICons.spacing,
                           height: UICons.textHeightOfText, alignment: .center)
                    .position(x: geometry.size.width / 2,
                              y: geometry.size.height - UICons.textDeltaCenterY)
                    .foregroundColor(
                        viewModel.currentView != tabBarNavigation ?
                            .warmGrey : .accentColor)
            }
            .frame(width: UIScreen.main.bounds.width /
                   UICons.numbersOfTabItems - UICons.spacing,
                   height: UICons.tabBarHeight)
        }
    }

    var helpButton: some View {
        Button {
            viewModel.changeTabView(nextView: tabBarNavigation)
        } label: {
            GeometryReader { geometry in
                Circle()
                    .foregroundColor(
                        viewModel.currentView != tabBarNavigation ?
                            .white : .accentColor)
                    .frame(width: UICons.circleSize, height: UICons.circleSize)
                    .shadow(color: .leaf, radius: 2.0, x: 0.0, y: 0.0)
                    .overlay {
                        Image(systemName: tabBarNavigation.imageName)
                            .frame(width: UICons.heartFrameWidth,
                                   height: UICons.heartFrameHeight)
                            .foregroundColor(
                                viewModel.currentView != tabBarNavigation ?
                                    .leaf : .white)
                    }
                    .position(x: geometry.size.width / 2,
                              y: geometry.size.height / 2 + UICons.helpButtonDeltaCenterY)
                Text(tabBarNavigation.name)
                    .font(.textStyle14)
                    .frame(width: UIScreen.main.bounds.width /
                           UICons.numbersOfTabItems - UICons.spacing,
                           height: UICons.textHeightOfText, alignment: .center)
                    .position(x: geometry.size.width / 2,
                              y: geometry.size.height - UICons.textDeltaCenterY)
                    .foregroundColor(
                        viewModel.currentView != tabBarNavigation ?
                            .warmGrey : .accentColor)
            }
            .frame(width: UIScreen.main.bounds.width /
                   UICons.numbersOfTabItems - UICons.spacing,
                   height: UICons.tabBarHeight)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(viewModel: ViewModel())
    }
}
