//
//  InfoDTO.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

// MARK: - InfoDTO
struct InfoDTO: Codable {
    let count, pages: Int?
    let next, prev: String?
}
