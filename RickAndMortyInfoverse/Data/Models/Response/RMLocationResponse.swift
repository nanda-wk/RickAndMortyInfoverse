//
//  RMLocationResponse.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

// MARK: - RMLocationResponse
struct RMLocationResponse: Codable {
    let info: InfoDTO?
    let results: [RMLocationDTO]
}

// MARK: - RMLocationDTO
struct RMLocationDTO: Codable {
    let id: Int?
    let name, type, dimension: String?
    let residents: [String]
    let url: String?
    let created: String?
}
