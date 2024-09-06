//
//  LocationsVM.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-05.
//

import Foundation

@Observable
class LocationsVM {
    
    private(set) var locations: [RMLocation] = []
    private var apiInfo: APIInfo? = nil
    
    var isLoading = false
    
    private let repository = RMRepository()
    
    func loadData() async {
        isLoading = true
        (apiInfo, locations) = await repository.fetchLocations(request: .listLocationsRequest)
        isLoading = false
    }
    
    func loadMoreData() async {
        isLoading = true
        guard let next = apiInfo?.next, let url = URL(string: next), let request = RMRequest(url: url) else {
            isLoading = false
            return
        }
        let (newApiInfo, newLocations) = await repository.fetchLocations(request: request)
        apiInfo = newApiInfo
        locations.append(contentsOf: newLocations)
        isLoading = false
    }
}

