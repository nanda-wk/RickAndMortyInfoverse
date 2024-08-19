//
//  RMRemoteDataSource.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

class RMRemoteDataSource {
    
    private let network = Network.shared
    
    func getAllCharacters() async -> [RMCharacter] {
        
        let response = try! await network.performRequest(RMRequestConfiguration.character, for: RMCharacterResponse.self)
        let characters = response.results.map{ RMCharacter(fromDTO: $0) }
        return characters
    }
    
    func getMultipleEpisodes(episodes ids: [String]) async -> [RMEpisode] {
        
        let response = try! await network.performRequest(RMRequestConfiguration.multipleEpisode(ids), for: [RMEpisodeDTO].self)
        let episodes = response.map{ RMEpisode(fromDTO: $0) }
        return episodes
    }
}

