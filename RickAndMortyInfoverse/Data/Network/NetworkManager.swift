//
//  NetworkManager.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-06.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func performRequest<T: Codable>(
        _ request: RMRequest,
        for type: T.Type
    ) async throws -> T {
        
        guard let urlRequest = self.request(from: request) else { throw NetworkError.requestError }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode)  else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let result = try JSONDecoder().decode(type.self, from: data)
            return result
        } catch {
            throw NetworkError.decodeError
        }
    }
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}
