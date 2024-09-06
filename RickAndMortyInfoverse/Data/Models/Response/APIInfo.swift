//
//  APIInfo.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-06.
//

import Foundation

struct APIInfo: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
    
    init(count: Int = 0, pages: Int = 0, next: String? = nil, prev: String? = nil) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}
