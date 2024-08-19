//
//  RickAndMortyInfoverseTests.swift
//  RickAndMortyInfoverseTests
//
//  Created by Nanda WK on 2024-08-10.
//

import XCTest
@testable import RickAndMortyInfoverse

final class RickAndMortyInfoverseTests: XCTestCase {

    func test_get_all_character() {
        let dataSource = RMRemoteDataSource()
        let characters = Task {
            await dataSource.getAllCharacters()
        }
        print(characters)
    }

}
