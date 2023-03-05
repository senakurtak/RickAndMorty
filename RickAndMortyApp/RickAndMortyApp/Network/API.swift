//
//  API.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 1.03.2023.
//

import Foundation
import Moya

enum API {
    case character
    case location
    case episode
}

extension API: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://rickandmortyapi.com/api/") else {fatalError()}
        return url
    }
    
    var path: String {
        switch self {
        case .character:
            return "character"
        case .location:
            return "location"
        case .episode:
            return "episode"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .character:
            return .requestPlain
        case .location:
            return .requestPlain
        case .episode:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
