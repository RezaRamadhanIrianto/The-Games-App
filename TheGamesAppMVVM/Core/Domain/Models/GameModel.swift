//
//  GameModel.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 23/04/21.
//

import Foundation

struct GameModel: Identifiable, Equatable {
    let id: Int
    let name: String
    let released: String
    
    let imageUrl: String
    let rating: Double
    
}
