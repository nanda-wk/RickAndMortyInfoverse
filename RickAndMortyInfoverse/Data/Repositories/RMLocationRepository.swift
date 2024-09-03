//
//  RMLocationRepository.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-03.
//

import Foundation

class RMLocationRepository {
    
    private let dataSource = RMRemoteDataSource()
    
    func getLocation(id: Int) async -> RMLocation {
        guard let location = await dataSource.getLocation(id: id) else { return RMLocation(id: 1, name: "N/A", type: "N/A", dimension: "N/A", residents: ["N/A"]) }
        return location
    }
}
