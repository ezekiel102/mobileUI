//
//  TabBarView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct TabBarView: View {

    //@State private var categories: [String] = ["news", "search", "help", "history", "profile"]

    var body: some View {
        TabView() {
            NewsView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Новости")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Поиск")
                }
            HelpView()
                .tabItem {
                    Image(systemName: "helm")
                    Text("Помочь")
                }
            HistoryView()
                .tabItem {
                    Image(systemName: "clock.arrow.circlepath")
                    Text("История")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Профиль")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
