//
//  Item.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-10.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
