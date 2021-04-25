//
//  GameEntity.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 25/04/21.
//

import Foundation
import RealmSwift

class GameEntity: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var released: String = ""
    @objc dynamic var imageUrl: String = ""
    @objc dynamic var rating: Double = 0.0
    @objc dynamic var page: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
