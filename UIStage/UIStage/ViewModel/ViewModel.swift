//
//  ViewModel.swift
//  UIStage
//
//  Created by Рустем on 02.03.2024.
//

import Foundation

class ViewModel: ObservableObject {

    @Published var categories: [HelpCategories] = [
        HelpCategories(name: "Дети", imageName: "kids"),
        HelpCategories(name: "Взрослые", imageName: "adults"),
        HelpCategories(name: "Пожилые", imageName: "grands"),
        HelpCategories(name: "Животные", imageName: "pets"),
        HelpCategories(name: "Мероприятия", imageName: "events")]

}
