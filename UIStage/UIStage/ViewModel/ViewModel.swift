//
//  ViewModel.swift
//  UIStage
//
//  Created by Рустем on 02.03.2024.
//

import Foundation
import UIKit
import SwiftUI

class ViewModel: ObservableObject {

    let readOperator = ReadOperator()

    @Published var categories: [HelpCategory] = []
    @Published var eventsList: [Event] = []

    init() {
        self.categories = self.readOperator.readListFromJSON("HelpCategories")
        self.eventsList = self.readOperator.readListFromJSON("Events")
    }

    func updateList(list: String) {
        self.categories = self.readOperator.readListFromJSON(list)
    }

    func filterEventsList(isFinished: Bool = false, category: String) -> [Event] {
        if isFinished {
            return self.eventsList.filter { $0.category.name == category && $0.isFinished}
        } else {
            return self.eventsList.filter { $0.category.name == category && !$0.isFinished}
        }
    }
}
