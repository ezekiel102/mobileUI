//
//  ViewModel.swift
//  UIStage
//
//  Created by Рустем on 02.03.2024.
//

import SwiftUI

class ViewModel: ObservableObject {

    @Published var currentView: TabBarNavigation = .help
    @Published var categories: [HelpCategories] = [
        HelpCategories(name: "Дети", imageName: "kids"),
        HelpCategories(name: "Взрослые", imageName: "adults"),
        HelpCategories(name: "Пожилые", imageName: "grands"),
        HelpCategories(name: "Животные", imageName: "pets"),
        HelpCategories(name: "Мероприятия", imageName: "events")]

    var name: String {
        currentView.name
    }

    func changeTabView(nextView: TabBarNavigation) {
        if nextView != currentView {
            currentView = nextView
        }
    }

    @ViewBuilder
    var view: some View {
        switch currentView {
        case .news:
            NewsView(viewModel: self)
        case .search:
            SearchView(viewModel: self)
        case .help:
            HelpView(viewModel: self)
        case .history:
            HistoryView(viewModel: self)
        case .profile:
            ProfileView(viewModel: self)
        }
    }
}
