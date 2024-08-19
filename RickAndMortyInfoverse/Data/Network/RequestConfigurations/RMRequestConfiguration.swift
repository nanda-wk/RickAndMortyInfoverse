//
//  RMRequestConfiguration.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Alamofire
import Foundation

enum RMRequestConfiguration: RequestConfiguration {
    
    case character
    case singleCharacter(Int)
    case multipleCharacter([String])
    case filterCharacter(Encodable)
    case episode
    case singleEpisode(Int)
    case multipleEpisode([String])
    case filterEpisode(Encodable)
    case location
    case singleLocation(Int)
    case multipleLocation([String])
    case filterLocation(Encodable)
    
    var endpoint: String {
        let characterEndpoint = RMEndpoint.character.rawValue
        let locationEndpoint = RMEndpoint.location.rawValue
        let episodeEndpoint = RMEndpoint.episode.rawValue
        switch self {
            case .character, .filterCharacter:
                return characterEndpoint
            case .episode, .filterEpisode:
                return episodeEndpoint
            case .location, .filterLocation:
                return locationEndpoint
            case .singleCharacter(let id):
                return "\(characterEndpoint)/\(id)"
            case .multipleCharacter(let ids):
                return "\(characterEndpoint)/\(ids)"
            case .singleEpisode(let id):
                return "\(episodeEndpoint)/\(id)"
            case .multipleEpisode(let ids):
                return "\(episodeEndpoint)/\(ids)"
            case .singleLocation(let id):
                return "\(locationEndpoint)/\(id)"
            case .multipleLocation(let ids):
                return "\(locationEndpoint)/\(ids)"
        }
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var encoding: ParameterEncoding {
        switch self {
            case .filterCharacter, .filterEpisode, .filterLocation:
                URLEncoding.queryString
            default:
                JSONEncoding.default
        }
    }

}
