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
    
    static let dummyEpisode = RMEpisode(
        id: 1,
        name: "Pilot",
        airDate: "December 2, 2013",
        episode: "S01E01",
        characters: [
            "1",
            "2",
            "35",
            "38",
            "62",
            "92",
            "127",
            "144",
            "158",
            "175",
            "179",
            "181",
            "239",
            "249",
            "271",
            "338",
            "394",
            "395",
            "435"
        ]
    )
}
