//
//  RMCharacterResponse.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-06.
//

import Foundation

struct RMCharacterResponse: Codable {
    let info: APIInfo
    let results: [RMCharacter]
}
