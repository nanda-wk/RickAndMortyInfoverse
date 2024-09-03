//
//  RMLocationMapper.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Foundation

extension RMLocation {
    init(fromDTO dto: RMLocationDTO) {
        self.id = dto.id ?? 0
        self.name = dto.name ?? ""
        self.type = dto.type ?? ""
        self.dimension = dto.dimension ?? ""
        self.residents = dto.residents.map{ $0.replacingOccurrences(of: String.replacePath(.character(1)), with: "") }
    }
}
