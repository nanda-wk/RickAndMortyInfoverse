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
    
    private let repository = RMRepository()
    
    init(episode: RMEpisode) {
        self.episode = episode
    }
    
    func loadData() async {
        isLoading = true
        guard let url = URL(string: episode.url), let request = RMRequest(url: url) else {
            isLoading = false
            return
        }
        let result = await repository.fetchEpisodeDetail(request: request)
        guard let result = result else { return }
        episode = result
        await fetchRelatedCharacters()
        isLoading = false
    }
    
    private func fetchRelatedCharacters() async {
        var urlString = "\(Constants.baseUrl)/\(RMEndpoint.character.rawValue)/"
        
        let charactersArray = episode.characters.map { $0.replacingOccurrences(of: urlString, with: "") }
        
        urlString += charactersArray.description
        
        guard let url = URL(string: urlString), let request = RMRequest(url: url) else {
            return
        }
        
        characters = await repository.fetchRelatedCharacters(request: request)
    }
}
