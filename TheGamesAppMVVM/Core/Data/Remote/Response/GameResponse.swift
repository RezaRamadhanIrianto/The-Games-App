//
//  GameResponse.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 23/04/21.
//

import Foundation
import RxSwift
import Alamofire

struct GamesResponse: Decodable {
    let games: [GameResponse]
    private enum CodingKeys: String, CodingKey{
        case games = "results"
    }
}

struct GameResponse: Decodable {
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case release = "released"
        case image_url = "background_image"
        case rating = "rating"
    }
    
    let id: Int?
    let name: String?
    let release: String?
    let image_url: String?
    let rating: Double?
}
