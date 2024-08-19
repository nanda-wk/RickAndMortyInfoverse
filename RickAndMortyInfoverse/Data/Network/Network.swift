//
//  Network.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-10.
//

import Alamofire
import Foundation

class Network: NetworkProtocol {
    
    static let shared = Network()

    private let decoder: JSONDecoder
    private let session = Session()

    private init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }

    func performRequest<T: Decodable>(
        _ configuration: RequestConfiguration,
        for type: T.Type
    ) async throws -> T {
        do {
            return try await request(
                session: session,
                configuration: configuration,
                decoder: decoder
            )
        } catch {
            debugPrint(error.localizedDescription, separator: ":::", terminator: "#")
            throw error
        }
        
    }
}
