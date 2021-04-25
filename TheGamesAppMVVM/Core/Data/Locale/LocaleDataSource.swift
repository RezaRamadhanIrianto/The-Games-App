//
//  LocaleDataSource.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 25/04/21.
//

import Foundation
import RealmSwift
import RxSwift

protocol LocaleDataSourceProtocol: class{
    func get<Value: Object>(sorted: String, page: Int) -> Observable<[Value]>
    func getGames() -> Observable<[GameEntity]>
    func addGames(from game: [GameEntity]) -> Observable<Bool>
    func add<Value: Object>(from game: [Value]) -> Observable<Bool>
}

final class LocaleDataSource: NSObject{
    private let realm: Realm?
    
    private init(realm: Realm?){
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> LocaleDataSource = {
        realmDatabase in
        return LocaleDataSource(realm:  realmDatabase)
    }
}

extension LocaleDataSource: LocaleDataSourceProtocol{
    func get<Value: Object>(sorted: String, page: Int) -> Observable<[Value]> {
        return Observable<[Value]>.create { observer in
            if let realm = self.realm {
                let results: Results<Value> = {
                    realm.objects(Value.self)
                        .filter("page = \(page)")
                        .sorted(byKeyPath: sorted, ascending: true)
                }()
                observer.onNext(results.toArray(ofType: Value.self))
                observer.onCompleted()
            }else{
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    func getGames() -> Observable<[GameEntity]> {
        return Observable<[GameEntity]>.create{
            observer in
            if let realm = self.realm {
                let game: Results<GameEntity> = {
                    realm.objects(GameEntity.self)
                        .sorted(byKeyPath: "name", ascending: true)
                }()
                observer.onNext(game.toArray(ofType: GameEntity.self))
                observer.onCompleted()
            }else{
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    func add<Value: Object>(from results: [Value]) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm{
                do{
                    try realm.write{
                        for result in results{
                            realm.add(result, update: .all)
                        }
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                }catch{
                    observer.onError(DatabaseError.requestFailed)
                }
            }else{
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }

    }
    func addGames(from game: [GameEntity]) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm{
                do{
                    try realm.write{
                        for g in game{
                            realm.add(g, update: .all)
                        }
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                }catch{
                    observer.onError(DatabaseError.requestFailed)
                }
            }else{
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
}

extension Results {

  func toArray<T>(ofType: T.Type) -> [T] {
    var array = [T]()
    for index in 0 ..< count {
      if let result = self[index] as? T {
        array.append(result)
      }
    }
    return array
  }

}
