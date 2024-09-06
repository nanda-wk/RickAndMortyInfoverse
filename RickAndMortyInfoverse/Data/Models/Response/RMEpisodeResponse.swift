//
//  RMEpisodeResponse.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-06.
//

import Foundation

struct RMEpisodeResponse: Codable {
    let info: APIInfo
    let results: [RMEpisode]
}
