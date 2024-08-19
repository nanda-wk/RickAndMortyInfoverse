//
//  CharacterDetailVM.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-13.
//

import Foundation

@Observable
class CharacterDetailVM {
    
    var character: RMCharacter
    
    var episodes: [RMEpisode] = []
    
    var isLoading = false
    
    private let repository = RMEpisodeRepository()

    init(character: RMCharacter) {
        self.character = character
        getEpisodes()
    }
    
    private func getEpisodes() {
        isLoading = true
        Task {
            self.episodes = await repository.getMultipleEpisodes(character.episode)
        }
        isLoading = false
    }
    
    
}



