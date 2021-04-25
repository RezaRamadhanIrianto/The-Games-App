//
//  GameRepository.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 23/04/21.
//

import Foundation
import RxSwift

protocol GameRepositoryProtocol {
    func getGames(page: Int) -> Observable<[GameModel]>
    func getDevelopers() -> Observable<[DeveloperModel]>
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
    func getGames(page: Int) -> Observable<[GameModel]> {
        return self.remote.get(url: Endpoints.Gets.games.url + "&page=\(page)")
            .map{ GameMapper.mapGameResponsesToDomains(input: $0) }
    }
    func getDevelopers() -> Observable<[DeveloperModel]> {
        return self.remote.get(url: Endpoints.Gets.developers.url)
            .map{ DeveloperMapper.mapDeveloperResponsesToDomains(input: $0) }
    }
}
