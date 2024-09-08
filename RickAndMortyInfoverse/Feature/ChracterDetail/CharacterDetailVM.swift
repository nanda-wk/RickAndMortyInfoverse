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
    var origin: RMLocation?
    var location: RMLocation?
    
    var isLoading = false
    var showTitle = false
    
    private let repository = RMRepository()
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    func loadData() async {
        isLoading = true
        guard let url = URL(string: character.url), let request = RMRequest(url: url) else {
            isLoading = false
            return
        }
        let result = await repository.fetchCharacterDetail(request: request)
        guard let result = result else { return }
        character = result
        await fetchRelatedEpisodes()
        isLoading = false
    }
    
    private func fetchRelatedEpisodes() async {
        var urlString = "\(Constants.baseUrl)/\(RMEndpoint.episode.rawValue)/"
        
        let episodesArray = character.episode.map { $0.replacingOccurrences(of: urlString, with: "") }
        
        urlString += episodesArray.description
        
        guard let url = URL(string: urlString), let request = RMRequest(url: url) else {
            return
        }
        
        episodes = await repository.fetchRelatedEpisodes(request: request)
    }
    
    
    func fetchRelatedOrigin() async {
        guard let url = URL(string: character.origin.url), let request = RMRequest(url: url) else {
            return
        }
        
        let result = await repository.fetchLocationDetail(request: request)
        guard let result = result else { return }
        origin = result
    }
    
    func fetchRelatedLocation() async {
        guard let url = URL(string: character.location.url), let request = RMRequest(url: url) else {
            return
        }
        
        let result = await repository.fetchLocationDetail(request: request)
        guard let result = result else { return }
        location = result
    }
}



