//
//  RMLocationResponse.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-06.
//

import Foundation

struct RMLocationResponse: Codable {
    let info: APIInfo
    let results: [RMLocation]
}
