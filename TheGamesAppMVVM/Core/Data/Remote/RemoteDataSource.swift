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
    func get<Value: Decodable>(url: String) -> Observable<[Value]>
}

final class RemoteDataSource: NSObject{
    private override init() {}
    
    static let sharedInstance: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol{
    func get<Value: Decodable>(url: String) -> Observable<[Value]> {
        return Observable<[Value]>.create { observer in
            if let url = URL(string: url){
                AF.request(url)
                    .validate()
                    .responseDecodable(of: Response<Value>.self){
                        response in
                        switch response.result{
                        case .success(let value) :
                            observer.onNext(value.results)
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
