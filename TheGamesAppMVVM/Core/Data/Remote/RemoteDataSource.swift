//
//  RemoteDataSource.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 23/04/21.
//

import Foundation
import Alamofire
import RxSwift

protocol RemoteDataSourceProtocol: class {
    func getGames() -> Observable<[GameResponse]>
}

final class RemoteDataSource: NSObject{
    private override init() {}
    
    static let sharedInstance: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol{
    func getGames() -> Observable<[GameResponse]> {
        return Observable<[GameResponse]>.create { observer in
            if let url = URL(string: Endpoints.Gets.games.url){
                AF.request(url)
                    .validate()
                    .responseDecodable(of: GamesResponse.self){
                        response in
                        switch response.result{
                        case .success(let value) :
                            observer.onNext(value.games)
                            observer.onCompleted()
                        case .failure :
                            observer.onError(URLError.invalidResponse)
                            observer.onCompleted()
                        }
                    }
            }
            return Disposables.create()
        }
    }
}
