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
    typealias GameInstance = (RemoteDataSource, LocaleDataSource) -> GameRepository
    fileprivate let remote: RemoteDataSource
    fileprivate let locale: LocaleDataSource
    
    private init(remote: RemoteDataSource, locale: LocaleDataSource) {
        self.remote = remote
        self.locale = locale
    }
    
    static let sharedInstance: GameInstance = {
        remoteRepo, localeRepo in
        return GameRepository(remote: remoteRepo, locale: localeRepo)
    }
}

extension GameRepository: GameRepositoryProtocol{
    func getGames(page: Int) -> Observable<[GameModel]> {
//        return self.remote.get(url: Endpoints.Gets.games.url + "&page=\(page)")
//            .map{ GameMapper.mapGameResponsesToDomains(input: $0) }
            
        return self.locale.get(sorted: "name", page: page)
            .map{ GameMapper.mapGameEntitiesToDomain(input: $0) }
            .filter{ !$0.isEmpty }
            .ifEmpty(switchTo: self.remote.get(url: Endpoints.Gets.games.url + "&page=\(page)")
                        .map{ GameMapper.mapGameResponseToEntities(input: $0, page: page) }
                        .flatMap{ self.locale.add(from: $0)}
                        .filter{ $0 }
                        .flatMap{
                            _ in self.locale.get(sorted: "name", page: page)
                                .map{ GameMapper.mapGameEntitiesToDomain(input: $0) }
                        }
            )
            
    }
    func getDevelopers() -> Observable<[DeveloperModel]> {
        return self.remote.get(url: Endpoints.Gets.developers.url)
            .map{ DeveloperMapper.mapDeveloperResponsesToDomains(input: $0) }
    }
}
