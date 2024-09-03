//
//  LocationDetailVM.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-03.
//

import Foundation

@Observable
class LocationDetailVM {
    
    let id: Int
    
    private(set) var location: RMLocation?
    
    private(set) var characters: [RMCharacter] = []
    
    var isLoading = false
    
    private let repoLocation = RMLocationRepository()
    private let repoCharacter = RMCharacterRepository()
    
    init(id: Int) {
        self.id = id
        getLocation()
    }
    
    private func getLocation() {
        isLoading = true
        Task {
            self.location = await repoLocation.getLocation(id: id)
            self.getCharacters()
            isLoading = false
        }
    }
    
    private func getCharacters() {
        Task {
            if let location = location {
                self.characters = await repoCharacter.getMultipleCharacters(location.residents)
            }
        }
    }
}
