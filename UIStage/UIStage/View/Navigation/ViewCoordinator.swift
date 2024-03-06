//
//  Navigator.swift
//  UIStage
//
//  Created by Рустем on 06.03.2024.
//

import SwiftUI

class ViewCoordinator: ObservableObject {

    @Published var currentMainView: MainTabBarNavigation = .help
    @Published var currentTabBarView: TabBarType = .mainTabBarNavigation

    var mainView: some View {
        currentMainView.view
    }

    var tabBarView: some View {
        currentTabBarView.view
    }
}

enum TabBarType {

    case mainTabBarNavigation
    case eventTabBarNavigation

    @ViewBuilder
    var view: some View {
        switch self {
        case .mainTabBarNavigation:
            MainTabBarView()
        case .eventTabBarNavigation:
            EventTabBarView()
        }
    }
}

enum MainTabBarNavigation: CaseIterable {

    case news
    case search
    case help
    case history
    case profile

    var name: String {
        switch self {
        case .news:
            return "Новости"
        case .search:
            return "Поиск"
        case .help:
            return "Помочь"
        case .history:
            return "История"
        case .profile:
            return "Профиль"
        }
    }

    var imageName: String {
        switch self {
        case .news:
            return "list.bullet"
        case .search:
            return "magnifyingglass"
        case .help:
            return "heart.fill"
        case .history:
            return "clock.arrow.circlepath"
        case .profile:
            return "person.crop.circle"
        }
    }

    @ViewBuilder
    var view: some View {
        switch self {
        case .news:
            NewsView()
        case .search:
            SearchView()
        case .help:
            HelpView()
        case .history:
            HistoryView()
        case .profile:
            ProfileView()
        }
    }
}

enum EventTabBarNavigation: CaseIterable {

    case items
    case volunteer
    case professional
    case donate

    var name: String {
        switch self {
        case .items:
            return "Помочь\nвещами"
        case .volunteer:
            return "Стать\nволонтером"
        case .professional:
            return "Проф.\nпомощь"
        case .donate:
            return "Помочь\nденьгами"
        }
    }

    var imageName: String {
        switch self {
        case .items:
            return "shirt"
        case .volunteer:
            return "hands"
        case .professional:
            return "tools"
        case .donate:
            return "coins"
        }
    }
}
