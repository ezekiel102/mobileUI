//
//  TabBarView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct TabBarView: View {

    @State private var tab = Tab.help

    enum Tab: Hashable {
        case news
        case search
        case help
        case history
        case profile
    }

    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.warmGreyTwo)
    }

    var body: some View {
        TabView(selection: $tab) {
            CategoriesView(category: "Новости", view: views.newsView)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Новости")
                }
                .tag(Tab.news)
            CategoriesView(category: "Поиск", view: views.searchView)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Поиск")
                }
                .tag(Tab.search)
            CategoriesView(category: "Помочь", view: views.helpView)
                .tabItem {
                    Image(systemName: "helm")
                    Text("Помочь")
                }
                .tag(Tab.help)
//            CategoriesView(category: "История", view: views.historyView)
//                .tabItem {
//                    Image(systemName: "clock.arrow.circlepath")
//                    Text("История")
//                }
//                .tag(Tab.history)
//            CategoriesView(category: "Профиль", view: views.profileView)
//                .tabItem {
//                    Image(systemName: "person.crop.circle")
//                    Text("Профиль")
//                }
//                .tag(Tab.profile)
//            CategoriesView(category: "Профиль", view: views.profileView)
//                .tabItem {
//                    Image(systemName: "person.crop.circle")
//                    Text("Профиль")
//                }
//                .tag(Tab.profile)
            Button {
                EmptyView()
            } label: {
                Image(systemName: "person.crop.circle")
                    .frame(width: 20, height: 20)
            }
            .tag(Tab.news)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
