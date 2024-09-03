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
    
    func getMultipleCharacters(characters ids: [String]) async -> [RMCharacter] {
        var characters = [RMCharacter]()
        do {
            let response = try await network.performRequest(RMRequestConfiguration.multipleCharacter(ids), for: [RMCharacterDTO].self)
            
            characters = response.map { RMCharacter(fromDTO: $0) }
        } catch {
            print(NetworkError.dataNotFound)
        }
        return characters
    }
    
    func getMultipleEpisodes(episodes ids: [String]) async -> [RMEpisode] {
        var episodes = [RMEpisode]()
        do {
            let response = try await network.performRequest(RMRequestConfiguration.multipleEpisode(ids), for: [RMEpisodeDTO].self)
            episodes = response.map { RMEpisode(fromDTO: $0) }
        } catch {
            print(NetworkError.dataNotFound)
        }
        return episodes
    }
    
    func getLocation(id: Int) async -> RMLocation? {
        do {
            let response = try await network.performRequest(RMRequestConfiguration.singleLocation(id), for: RMLocationDTO.self)
            return RMLocation(fromDTO: response)
        } catch {
            print(NetworkError.dataNotFound)
        }
        return nil
    }
}

