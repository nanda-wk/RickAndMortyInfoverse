//
//  RMRemoteDataSource.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

class RMRemoteDataSource {
    
    private let network = Network.shared
    
    func getAllCharacters(page: Int = 1) async -> [RMCharacterDTO] {
        do {
            let response = try await network.performRequest(RMRequestConfiguration.character(page), for: RMCharacterResponse.self)
            return response.results
        } catch {
            print(NetworkError.dataNotFound)
        }
        return []
    }
    
    func getMultipleCharacters(characters ids: [String]) async -> [RMCharacterDTO] {
        do {
            let result = try await network.performRequest(RMRequestConfiguration.multipleCharacter(ids), for: [RMCharacterDTO].self)
            
            return result
        } catch {
            print(NetworkError.dataNotFound)
        }
        return []
    }
    
    func getCharacter(id: Int) async -> RMCharacterDTO? {
        do {
            let result = try await network.performRequest(RMRequestConfiguration.singleCharacter(id), for: RMCharacterDTO.self)
            return result
        } catch {
            print(NetworkError.dataNotFound)
        }
        return nil
    }
    
    func getAllEpisodes(page: Int = 1) async -> [RMEpisodeDTO] {
        do {
            let response = try await network.performRequest(RMRequestConfiguration.episode(page), for: RMEpisodeResponse.self)
            return response.results
        } catch {
            print(NetworkError.dataNotFound)
        }
        return []
    }
    
    func getMultipleEpisodes(episodes ids: [String]) async -> [RMEpisodeDTO] {
        do {
            let result = try await network.performRequest(RMRequestConfiguration.multipleEpisode(ids), for: [RMEpisodeDTO].self)
            return result
        } catch {
            print(NetworkError.dataNotFound)
        }
        return []
    }
    
    func getEpisode(id: Int) async -> RMEpisodeDTO? {
        do {
            let result = try await network.performRequest(RMRequestConfiguration.singleEpisode(id), for: RMEpisodeDTO.self)
            return result
        } catch {
            print(NetworkError.dataNotFound)
        }
        return nil
    }
    
    func getAllLocations(page: Int = 1) async -> [RMLocationDTO] {
        do {
            let response = try await network.performRequest(RMRequestConfiguration.location(page), for: RMLocationResponse.self)
            return response.results
        } catch {
            print(NetworkError.dataNotFound)
        }
        return []
    }
    
    func getMultipleLocations(locations ids: [String]) async -> [RMLocationDTO] {
        do {
            let result = try await network.performRequest(RMRequestConfiguration.multipleLocation(ids), for: [RMLocationDTO].self)
            
            return result
        } catch {
            print(NetworkError.dataNotFound)
        }
        return []
    }
    
    func getLocation(id: Int) async -> RMLocationDTO? {
        do {
            let result = try await network.performRequest(RMRequestConfiguration.singleLocation(id), for: RMLocationDTO.self)
            return result
        } catch {
            print(NetworkError.dataNotFound)
        }
        return nil
    }
}

