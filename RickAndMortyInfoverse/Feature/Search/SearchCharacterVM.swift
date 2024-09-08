//
//  SearchCharacterVM.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-08.
//

import Foundation

@Observable
class SearchCharacterVM {
    
    var characters: [RMCharacter] = []
    
    var searchName: String = ""
    var statusTitle: String = "Status"
    var genderTitle: String = "Gender"
    
    var status : RMCharacterStatus = .alive {
        didSet {
            statusTitle = status.rawValue
        }
    }
    var gender : RMCharacterGender = .male {
        didSet {
            genderTitle = gender.rawValue
        }
    }
    
    var isSheetPresented: Bool = false
    var isLoading = false
    
    private let repository = RMRepository()
    private var apiInfo: APIInfo? = nil
    
    func searchCharacter() async {
        isLoading = true
        characters.removeAll()
        let queryParameters = RMSearch(name: searchName, status: status.rawValue, gender: gender.rawValue).toQueryItems()
        let request = RMRequest(endpoint: .character, queryParameters: queryParameters)
        (apiInfo, characters) = await repository.fetchCharacters(request: request)
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
