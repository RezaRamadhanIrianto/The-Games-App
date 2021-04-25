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
    
    static func mapGameResponseToEntities(input gameResponse: [GameResponse], page: Int) -> [GameEntity]{
        return gameResponse.map{
            result in
            let newGame = GameEntity()
            newGame.id = result.id ?? 0
            newGame.imageUrl = result.image_url ?? ""
            newGame.name = result.name ?? ""
            newGame.rating = result.rating ?? 0.0
            newGame.released = result.release ?? ""
            newGame.page = page
            return newGame
        }
    }
    
    static func mapGameEntitiesToDomain(input gameEntities: [GameEntity]) -> [GameModel]{
        return gameEntities.map { result in
            return GameModel(id: result.id, name: result.name, released: result.released, imageUrl: result.imageUrl, rating: result.rating)
        }
    }
}
