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
    
    static let dummyLocation = RMLocation(id: 1, name: "Earth (C-137)", type: "Planet", dimension: "Dimension C-137", residents: [
        "38",
        "45",
        "71",
        "82",
        "83",
        "92",
        "112",
        "114",
        "116",
        "117",
        "120",
        "127",
        "155",
        "169",
        "175",
        "179",
        "186",
        "201",
        "216",
        "239",
        "271",
        "302",
        "303",
        "338",
        "343",
        "356",
        "394"
    ])
}
