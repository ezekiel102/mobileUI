//
//  SwiftUIView.swift
//  UIStage
//
//  Created by Рустем on 02.03.2024.
//

import SwiftUI

enum TabBarNavigation: CaseIterable {

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
    func changeView(viewModel: ViewModel) -> some View {
        switch self {
        case .news:
            NewsView(viewModel: viewModel)
        case .search:
            SearchView(viewModel: viewModel)
        case .help:
            HelpView(viewModel: viewModel)
        case .history:
            HistoryView(viewModel: viewModel)
        case .profile:
            ProfileView(viewModel: viewModel)
        }
    }
}
