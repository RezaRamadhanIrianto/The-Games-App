//
//  DeveloperMapper.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 24/04/21.
//

import Foundation

struct DeveloperResponse: Decodable {
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case games_count = "games_count"
        case image_url = "image_background"
    }
    
    let id: Int?
    let name: String?
    let games_count: Int?
    let image_url: String?
}
