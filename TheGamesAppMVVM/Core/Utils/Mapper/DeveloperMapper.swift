//
//  DeveloperMapper.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 24/04/21.
//

import Foundation

final class DeveloperMapper{
    static func mapDeveloperResponsesToDomains(input developerResponse: [DeveloperResponse]) -> [DeveloperModel]{
        return developerResponse.map{
            result in
            return DeveloperModel(id: result.id ?? 0, name: result.name ?? "", gamesCount: result.games_count ?? 0, imageUrl: result.image_url ?? "")
        }
    }
}
