//
//  LocationsVM.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-05.
//

import Foundation

@Observable
class LocationsVM {
    var locations: [RMLocation] = []
    var searchName: String = "" {
        didSet {
            Task {
                await loadData()
            }
        }
    }

    var isLoading = false

    private let repository = RMRepository()
    private var apiInfo: APIInfo?

    func loadData() async {
        isLoading = true
        let queryParameters = RMSearch(name: searchName).toQueryItems()
        let request = RMRequest(endpoint: .location, queryParameters: queryParameters)
        (apiInfo, locations) = await repository.fetchLocations(request: request)
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
