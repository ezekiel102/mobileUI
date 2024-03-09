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

    func readListFromJSON<T: Codable>(_ file: String) -> [T] {
        let path = Bundle.main.path(forResource: file, ofType: "json")!
        let data = FileManager.default.contents(atPath: path)!
        let list = try! decoder.decode([T].self, from: data)
        return list
    }

}
