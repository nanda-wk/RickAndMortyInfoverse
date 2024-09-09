//
//  LocationDetailVM.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-03.
//

import Foundation

@Observable
class LocationDetailVM {
    var location: RMLocation
    var characters: [RMCharacter] = []

    var isLoading = false

    private let repository = RMRepository()

    init(location: RMLocation) {
        self.location = location
    }

    func loadData() async {
        isLoading = true
        guard let url = URL(string: location.url), let request = RMRequest(url: url) else {
            isLoading = false
            return
        }
        let result = await repository.fetchLocationDetail(request: request)
        guard let result = result else { return }
        location = result
        await fetchRelatedCharacters()
        isLoading = false
    }

    private func fetchRelatedCharacters() async {
        guard !location.residents.isEmpty else { return }
        var urlString = "\(Constants.baseUrl)/\(RMEndpoint.character.rawValue)/"

        let charactersArray = location.residents.map { $0.replacingOccurrences(of: urlString, with: "") }

        urlString += charactersArray.description

        guard let url = URL(string: urlString), let request = RMRequest(url: url) else {
            return
        }

        characters = await repository.fetchRelatedCharacters(request: request)
    }
}
