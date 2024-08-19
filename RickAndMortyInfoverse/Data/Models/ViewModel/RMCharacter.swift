//
//  RMCharacter.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

// MARK: - RMCharacter
struct RMCharacter: Codable, Identifiable {
    let id: Int
    let name, species, type: String
    let status: RMCharacterStatus
    let gender: RMCharacterGender
    let origin, location: Location
    let image: String
    let episode: [String]
}

struct Location: Codable {
    let name, url: String
}


extension RMCharacter {
    static let dummyCharacterLive = RMCharacter(
        id: 1,
        name: "Rick Sanchez",
        species: "Human",
        type: "",
        status: .alive,
        gender: .male,
        origin: Location(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
        location: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        episode: [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2"
        ]
    )
    
    static let dummyCharacterDead = RMCharacter(
        id: 8,
        name: "Adjudicator Rick",
        species: "Human",
        type: "",
        status: .dead,
        gender: .genderless,
        origin: Location(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
        location: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
        image: "https://rickandmortyapi.com/api/character/avatar/8.jpeg",
        episode: [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2",
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2",
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2",
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2"
        ]
    )
}
