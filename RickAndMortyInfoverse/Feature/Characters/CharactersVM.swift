//
//  CharacterVM.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

@Observable
class CharactersVM {
    
    private(set) var characters: [RMCharacter] = []
    private var apiInfo: APIInfo? = nil
    
    var isLoading = false
        
    private let repository = RMRepository()
    
    func loadData() async {
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
