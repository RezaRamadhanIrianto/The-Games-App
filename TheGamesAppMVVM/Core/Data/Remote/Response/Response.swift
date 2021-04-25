//
//  Response.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 24/04/21.
//

import Foundation
import RxSwift
import Alamofire

struct Response<Value: Decodable>: Decodable {
    let results: [Value]
    private enum CodingKeys: String, CodingKey{
        case results = "results"
    }
}
