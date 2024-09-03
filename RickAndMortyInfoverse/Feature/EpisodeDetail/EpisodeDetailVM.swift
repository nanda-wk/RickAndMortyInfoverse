//
//  EpisodeDetailVM.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-02.
//

import Foundation

@Observable
class EpisodeDetailVM {
    
    private(set) var episode: RMEpisode
    
    private(set) var characters: [RMCharacter] = []
    
    var isLoading = false
    
    private let repository = RMCharacterRepository()
    
    init(episode: RMEpisode) {
        self.episode = episode
        getCharacters()
    }
    
    private func getCharacters() {
        isLoading = true
        Task {
            self.characters = await repository.getMultipleCharacters(episode.characters)
            isLoading = false
        }
    }
    
}
