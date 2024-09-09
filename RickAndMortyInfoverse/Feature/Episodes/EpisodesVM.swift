//
//  EpisodesVM.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-07.
//

import Foundation

@Observable
class EpisodesVM {
    var episodes: [RMEpisode] = []
    var searchName: String = "" {
        didSet {
            Task {
                await loadData()
            }
        }
    }

    var isLoading = false

    private let repository = RMRepository()
    private var apiInfo: APIInfo?

    func loadData() async {
        isLoading = true
        var queryParameters = RMSearch(name: searchName).toQueryItems()
        var request = RMRequest(endpoint: .episode, queryParameters: queryParameters)
        (apiInfo, episodes) = await repository.fetchEpisodes(request: request)
        if episodes.isEmpty {
            queryParameters = RMSearch(episode: searchName).toQueryItems()
            request = RMRequest(endpoint: .episode, queryParameters: queryParameters)
            (apiInfo, episodes) = await repository.fetchEpisodes(request: request)
        }
        isLoading = false
    }

    func loadMoreData() async {
        isLoading = true
        guard let next = apiInfo?.next, let url = URL(string: next), let request = RMRequest(url: url) else {
            isLoading = false
            return
        }
        let (newApiInfo, newCharacters) = await repository.fetchEpisodes(request: request)
        apiInfo = newApiInfo
        episodes.append(contentsOf: newCharacters)
        isLoading = false
    }
}
