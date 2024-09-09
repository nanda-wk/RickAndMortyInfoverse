//
//  RMSearch.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-08.
//

import Foundation

struct RMSearch {
    let name: String
    let status: String
    let gender: String
    let episode: String

    init(name: String = "", status: String = "", gender: String = "", episode: String = "") {
        self.name = name
        self.status = status
        self.gender = gender
        self.episode = episode
    }
}

extension RMSearch {
    func toQueryItems() -> [URLQueryItem] {
        var queryItems: [URLQueryItem] = []

        let mirror = Mirror(reflecting: self)

        for case let (label?, value) in mirror.children {
            if let stringValue = value as? String, !stringValue.isEmpty {
                queryItems.append(URLQueryItem(name: label, value: stringValue))
            }
        }

        return queryItems
    }
}
