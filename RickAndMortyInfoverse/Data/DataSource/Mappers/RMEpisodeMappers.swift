//
//  RMEpisodeMappers.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-19.
//

import Foundation

extension RMEpisode {
    init(fromDTO dto: RMEpisodeDTO) {
        self.id = dto.id ?? 0
        self.name = dto.name ?? ""
        self.airDate = dto.airDate ?? ""
        self.episode = dto.episode ?? ""
        self.characters = dto.characters.map{ $0.replacingOccurrences(of: String.replacePath(.character), with: "") }
    }
}
