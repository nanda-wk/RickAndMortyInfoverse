//
//  RMEpisodeResponse.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

// MARK: - RMEpisodeResponse
struct RMEpisodeResponse: Codable {
    let info: InfoDTO?
    let results: [RMEpisodeDTO]
}

// MARK: - RMEpisodeDTO
struct RMEpisodeDTO: Codable {
    let id: Int?
    let name, airDate, episode: String?
    let characters: [String]
    let url: String?
    let created: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
