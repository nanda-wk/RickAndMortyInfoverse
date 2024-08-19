//
//  RMCharacterRepository.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

class RMCharacterRepository {
    
    private let dataSource = RMRemoteDataSource()
    
    func getAllCharacters() async -> [RMCharacter] {
        let characters = await dataSource.getAllCharacters()
        return characters
    }
    
}
