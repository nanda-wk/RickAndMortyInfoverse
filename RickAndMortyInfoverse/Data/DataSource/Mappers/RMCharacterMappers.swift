//
//  RMCharacterMappers.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

extension RMCharacter {
    init(fromDTO dto: RMCharacterDTO) {
        self.id = dto.id ?? 0
        self.name = dto.name ?? ""
        self.species = dto.species ?? ""
        self.type = dto.type ?? ""
        self.status = dto.status ?? .unknown
        self.gender = dto.gender ?? .unknown
        self.origin = Origin(name: dto.origin?.name ?? "", id: dto.origin?.url?.replacingOccurrences(of: String.replacePath(.location(1)), with: "") ?? "")
        self.location = Location(name: dto.location?.name ?? "", id: dto.location?.url?.replacingOccurrences(of: String.replacePath(.location(1)), with: "") ?? "")
        self.image = dto.image ?? ""
        self.episode = dto.episode.map{ $0.replacingOccurrences(of: String.replacePath(.episode(1)), with: "") }
    }
}
