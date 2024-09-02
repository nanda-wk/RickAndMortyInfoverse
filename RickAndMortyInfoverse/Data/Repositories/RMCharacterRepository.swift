//
//  RMCharacterRepository.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

class RMCharacterRepository {
    
    private let dataSource = RMRemoteDataSource()
    
    func getAllCharacters(page: Int) async -> [RMCharacter] {
        let characters = await dataSource.getAllCharacters(page: page)
        return characters
    }
    
    func getMultipleCharacters(_ ids: [String]) async -> [RMCharacter] {
        let characters = await dataSource.getMultipleCharacters(characters: ids)
        return characters
    }
    
}
