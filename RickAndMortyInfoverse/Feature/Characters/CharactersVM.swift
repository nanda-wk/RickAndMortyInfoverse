//
//  CharacterVM.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

@Observable
class CharactersVM {
    
    private(set) var characters = [RMCharacter]()
    private let repository = RMCharacterRepository()
    var isLoading = false
    private var page = 0
    
    init() {
        loadCharacters()
    }
    
    func loadCharacters() {
        isLoading = true
        page += 1
        Task {
            let characters = await repository.getAllCharacters(page: page)
            self.characters.append(contentsOf: characters)
        }
        isLoading = false
    }
}
