//
//  ReadOperator.swift
//  UIStage
//
//  Created by Рустем on 08.03.2024.
//

import UIKit

struct ReadOperator {

    init(decoder: JSONDecoder = JSONDecoder()) {
        decoder.dateDecodingStrategy = .secondsSince1970
        self.decoder = decoder
    }

    let decoder: JSONDecoder

    func loadHelpCategoriesList(_ file: String) -> [HelpCategory] {
        let path = Bundle.main.path(forResource: file, ofType: "json")!
        let data = FileManager.default.contents(atPath: path)!
        let helpCategoriesList = try! decoder.decode([HelpCategory].self, from: data)
        return helpCategoriesList
    }

    func loadEventsList(_ file: String) -> [Event] {
        let path = Bundle.main.path(forResource: file, ofType: "json")!
        let data = FileManager.default.contents(atPath: path)!
        let eventsList = try! decoder.decode([Event].self, from: data)
        return eventsList
    }
}

extension JSONDecoder {

}
