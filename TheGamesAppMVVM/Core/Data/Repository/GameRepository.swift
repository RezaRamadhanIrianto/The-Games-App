//
//  GameRepository.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 23/04/21.
//

import Foundation
import RxSwift

protocol GameRepositoryProtocol {
    func getGames() -> Observable<[GameModel]>
}

final class GameRepository: NSObject{
    typealias GameInstance = (RemoteDataSource) -> GameRepository
    fileprivate let remote: RemoteDataSource
    
    private init(remote: RemoteDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: GameInstance = {
        remoteRepo in
        return GameRepository(remote: remoteRepo)
    }
}

extension GameRepository: GameRepositoryProtocol{
    func getGames() -> Observable<[GameModel]> {
        return self.remote.getGames()
            .map{ GameMapper.mapGameResponsesToDomains(input: $0) }
    }
}
