//
//  RMCharacter.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

// MARK: - RMCharacter
struct RMCharacter: Codable, Identifiable, Hashable {
    let id: Int
    let name, species, type: String
    let status: RMCharacterStatus
    let gender: RMCharacterGender
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
}

typealias Origin = Location

struct Location: Codable, Hashable {
    let name, id: String
}


extension RMCharacter {
    static let dummyCharacterLive = RMCharacter(
        id: 1,
        name: "Rick Sanchez",
        species: "Human",
        type: "",
        status: .alive,
        gender: .male,
        origin: Location(name: "Earth (C-137)", id: "1"),
        location: Location(name: "Citadel of Ricks", id: "3"),
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        episode: [
            "1",
            "2"
        ]
    )
    
    static let dummyCharacterDead = RMCharacter(
        id: 8,
        name: "Adjudicator Rick",
        species: "Human",
        type: "",
        status: .dead,
        gender: .genderless,
        origin: Location(name: "Earth (C-137)", id: "1"),
        location: Location(name: "Citadel of Ricks", id: "3"),
        image: "https://rickandmortyapi.com/api/character/avatar/8.jpeg",
        episode: [
            "1",
            "2",
            "11",
            "23",
            "12",
            "22",
            "4",
            "6"
        ]
    )
}
