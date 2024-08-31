//
//  RMRemoteDataSource.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

class RMRemoteDataSource {
    
    private let network = Network.shared
    
    func getAllCharacters(page: Int = 1) async -> [RMCharacter] {
        var characters = [RMCharacter]()
        do {
            let response = try await network.performRequest(RMRequestConfiguration.character(page), for: RMCharacterResponse.self)
            characters = response.results.map{ RMCharacter(fromDTO: $0) }
        } catch {
            print(NetworkError.dataNotFound)
        }
        return characters
    }
    
    func getMultipleEpisodes(episodes ids: [String]) async -> [RMEpisode] {
        
        let response = try! await network.performRequest(RMRequestConfiguration.multipleEpisode(ids), for: [RMEpisodeDTO].self)
        let episodes = response.map{ RMEpisode(fromDTO: $0) }
        return episodes
    }
}

