//
//  RMEpisode.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-14.
//

import Foundation

// MARK: - RMEpisode
struct RMEpisode: Codable, Identifiable, Hashable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
}
