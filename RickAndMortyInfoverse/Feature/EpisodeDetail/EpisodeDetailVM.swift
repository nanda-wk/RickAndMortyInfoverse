//
//  EpisodeDetailVM.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-02.
//

import Foundation

@Observable
class EpisodeDetailVM {
    
    var episode: RMEpisode
    
    var characters: [RMCharacter] = []
    
    var isLoading = false
    
    var showTitle = false
    
    init(episode: RMEpisode) {
        self.episode = episode
    }
    
}
