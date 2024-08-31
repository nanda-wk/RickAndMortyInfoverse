//
//  NetworkProtocol.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-10.
//

import Alamofire
import Foundation

protocol NetworkProtocol {
    
    func performRequest<T: Decodable>(
        _ configuration: RequestConfiguration,
        for type: T.Type
    ) async throws -> T
}

extension NetworkProtocol {
    
    func request<T: Decodable>(
        session: Session,
        configuration: RequestConfiguration,
        decoder: JSONDecoder
    ) async throws -> T {
        try await session.request(
            configuration.url,
            method: configuration.method,
            parameters: configuration.parameters,
            encoding: configuration.encoding,
            headers: configuration.headers,
            interceptor: configuration.interceptor
        )
        .validate(statusCode: 200..<300)
        .serializingDecodable(T.self)
        .value
    }
}
