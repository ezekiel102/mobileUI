//
//  ViewModel.swift
//  UIStage
//
//  Created by Рустем on 02.03.2024.
//

import Foundation

class ViewModel: ObservableObject {

    let readOperator = ReadOperator()

    @Published var categories: [HelpCategory] = []
    @Published var eventsList: [Event] = []

    init() {
        self.categories = self.readOperator.loadHelpCategoriesList("HelpCategories")
        self.eventsList = self.readOperator.loadEventsList("Events")
        print(eventsList)
    }

    func updateHelpCatrgoriesList() {
        self.categories = self.readOperator.loadHelpCategoriesList("HelpCategories")
    }

    func updateEventsList() {
        self.eventsList = self.readOperator.loadEventsList("Events")
    }
}
