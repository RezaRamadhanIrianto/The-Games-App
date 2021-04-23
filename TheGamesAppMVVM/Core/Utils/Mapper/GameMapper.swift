//
//  GameMapper.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 23/04/21.
//

import Foundation

final class GameMapper{
    static func mapGameResponsesToDomains(input gameResponse: [GameResponse]) -> [GameModel]{
        return gameResponse.map{
            result in
            return GameModel(
                id: result.id ?? 0, name: result.name ?? "Unknown", released: result.release ?? "00 - 00 - 0000", imageUrl: result.image_url ?? "", rating: result.rating ?? 0.0
            )
        }
    }
}
