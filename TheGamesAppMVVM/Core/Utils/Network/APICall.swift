//
//  APICall.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 23/04/21.
//

import Foundation

struct API {
    static let baseUrl = "https://api.rawg.io/api/"
    static let key = "f388590d04c64414a086a5e7d5642b64"
}

protocol Endpoint {
    var url: String { get }
}

enum Endpoints {
    enum Gets: Endpoint{
            case creators
            case developers
            case games
    
            public var url: String{
                switch self {
                case .creators :
                    return "\(API.baseUrl)creators?key=\(API.key)"
                case .developers :
                    return "\(API.baseUrl)developers?key=\(API.key)"
                case .games :
                    return "\(API.baseUrl)games?key=\(API.key)"
                }
            }
        }
}
