//
//  LocationsVM.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-05.
//

import Foundation

@Observable
class LocationsVM {
    
    var dataTuple: [(location: RMLocation, residents: [URL])] = []
    
    private let repoLocation = RMLocationRepository()
    private let repoCharacter = RMCharacterRepository()
    
    var isLoading = false
    
    var page = 0
    
    init() {
        loadLocations()
    }
    
    func loadLocations() {
        isLoading = true
        page += 1
        Task {
            try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
            let locations = await repoLocation.getAllLocations(page: page)
            for location in locations {
                var residents: [URL] = []
                if !location.residents.isEmpty {
                    residents = await repoCharacter.getResidentsAvatars(location.residents)
                }
                let tuple = (location, residents)
                self.dataTuple.append(tuple)
            }
            isLoading = false
        }
    }
}

