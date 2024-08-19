//
//  RMResponse.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

struct RMCharacterResponse: Codable {
    let info: InfoDTO?
    let results: [RMCharacterDTO]
}

// MARK: - RMCharacterDTO
struct RMCharacterDTO: Codable {
    let id: Int?
    let name, species, type: String?
    let status: RMCharacterStatus?
    let gender: RMCharacterGender?
    let origin: OriginDTO?
    let location: LocationDTO?
    let image: String?
    let episode: [String]
    let url: String?
    let created: String?
}

// MARK: - OriginDTO & LocationDTO
typealias OriginDTO = LocationDTO
struct LocationDTO: Codable {
    let name: String?
    let url: String?
}
