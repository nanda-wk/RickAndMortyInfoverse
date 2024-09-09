//
//  CharactersVM.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

@Observable
class CharactersVM {
    var characters: [RMCharacter] = []

    var isLoading = false

    private let repository = RMRepository()
    private var apiInfo: APIInfo?

    func loadData() async {
        if apiInfo != nil { return }
        isLoading = true
        (apiInfo, characters) = await repository.fetchCharacters(request: .listCharactersRequest)
        isLoading = false
    }

    func loadMoreData() async {
        isLoading = true
        guard let next = apiInfo?.next, let url = URL(string: next), let request = RMRequest(url: url) else {
            isLoading = false
            return
        }
        let (newApiInfo, newCharacters) = await repository.fetchCharacters(request: request)
        apiInfo = newApiInfo
        characters.append(contentsOf: newCharacters)
        isLoading = false
    }
}
