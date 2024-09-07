//
//  EpisodesVM.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-07.
//

import Foundation

@Observable
class EpisodesVM {
    
    private(set) var episodes: [RMEpisode] = []
    private var apiInfo: APIInfo? = nil
    
    var isLoading = false
        
    private let repository = RMRepository()
    
    func loadData() async {
        if apiInfo != nil { return }
        isLoading = true
        (apiInfo, episodes) = await repository.fetchEpisodes(request: .listEpisodesRequest)
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
