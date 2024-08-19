//
//  RMCharacterMappers.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

extension RMCharacter {
    init(fromDTO dto: RMCharacterDTO) {
//        var string = try! RMRequestConfiguration.episode.url.asURL().absoluteString
//        string += "/"
        self.id = dto.id ?? 0
        self.name = dto.name ?? ""
        self.species = dto.species ?? ""
        self.type = dto.type ?? ""
        self.status = dto.status ?? .unknown
        self.gender = dto.gender ?? .unknown
        self.origin = Location(name: dto.location?.name ?? "", url: dto.location?.url ?? "")
        self.location = Location(name: dto.location?.name ?? "", url: dto.location?.url ?? "")
        self.image = dto.image ?? ""
        self.episode = dto.episode.map{ $0.replacingOccurrences(of: String.replacePath(.episode), with: "") }
    }
}
