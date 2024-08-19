//
//  RMEpisodeRepository.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-19.
//

import Foundation

class RMEpisodeRepository {
    
    private let dataSource = RMRemoteDataSource()
    
    func getMultipleEpisodes(_ ids: [String]) async -> [RMEpisode] {
        let episodes = await dataSource.getMultipleEpisodes(episodes: ids)
        return episodes
    }
}
