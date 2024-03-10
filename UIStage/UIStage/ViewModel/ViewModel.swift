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

    private let readOperator = ReadOperator()

    @Published var categories: [HelpCategory] = []
    @Published var eventsList: [Event] = []

    init() {
        do {
            self.categories = try self.readOperator.readListFromJSON("HelpCategories")
        } catch {
            print("Categories load error: \(error)")
        }
        do {
            self.eventsList = try self.readOperator.readListFromJSON("Events")
        } catch {
            print("Events list load error: \(error)")
        }
    }

    func updateList(list: String) {
        do {
            self.categories = try self.readOperator.readListFromJSON(list)
        } catch {
            print(error)
        }
    }

    func filterEventsList(isFinished: Bool = false, category: String) -> [Event] {
        self.eventsList.filter { $0.category.name == category && $0.isFinished == isFinished }
    }
}
