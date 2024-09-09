//
//  RMRepository.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-06.
//

import Foundation

class RMRepository {
    private let network = NetworkManager.shared

    func fetchCharacters(request: RMRequest) async -> (APIInfo, [RMCharacter]) {
        do {
            let response = try await network.performRequest(request, for: RMCharacterResponse.self)
            return (response.info, response.results)
        } catch {
            print(error)
            return (APIInfo(), [])
        }
    }

    func fetchCharacterDetail(request: RMRequest) async -> RMCharacter? {
        do {
            let response = try await network.performRequest(request, for: RMCharacter.self)
            return response
        } catch {
            print(error)
            return nil
        }
    }

    func fetchRelatedCharacters(request: RMRequest) async -> [RMCharacter] {
        do {
            let response = try await network.performRequest(request, for: [RMCharacter].self)
            return response
        } catch {
            print(error)
            return []
        }
    }

    func fetchEpisodes(request: RMRequest) async -> (APIInfo, [RMEpisode]) {
        do {
            let response = try await network.performRequest(request, for: RMEpisodeResponse.self)
            return (response.info, response.results)
        } catch {
            print(error)
            return (APIInfo(), [])
        }
    }

    func fetchEpisodeDetail(request: RMRequest) async -> RMEpisode? {
        do {
            let response = try await network.performRequest(request, for: RMEpisode.self)
            return response
        } catch {
            print(error)
            return nil
        }
    }

    func fetchRelatedEpisodes(request: RMRequest) async -> [RMEpisode] {
        do {
            let response = try await network.performRequest(request, for: [RMEpisode].self)
            return response
        } catch {
            print(error)
            return []
        }
    }

    func fetchLocations(request: RMRequest) async -> (APIInfo, [RMLocation]) {
        do {
            let response = try await network.performRequest(request, for: RMLocationResponse.self)
            return (response.info, response.results)
        } catch {
            print(error)
            return (APIInfo(), [])
        }
    }

    func fetchLocationDetail(request: RMRequest) async -> RMLocation? {
        do {
            let response = try await network.performRequest(request, for: RMLocation.self)
            return response
        } catch {
            print(error)
            return nil
        }
    }

    func fetchRelatedLocations(request: RMRequest) async -> [RMLocation] {
        do {
            let response = try await network.performRequest(request, for: [RMLocation].self)
            return response
        } catch {
            print(error)
            return []
        }
    }
}
