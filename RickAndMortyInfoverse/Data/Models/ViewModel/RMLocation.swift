//
//  RMLocation.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

// MARK: - RMLocation
struct RMLocation: Codable, Identifiable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
}
