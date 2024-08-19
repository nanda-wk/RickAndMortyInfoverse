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
    
    init() {
        loadCharacters()
    }
    
    private func loadCharacters() {
        isLoading = true
        Task {
            self.characters = await repository.getAllCharacters()
        }
        isLoading = false
    }
}
