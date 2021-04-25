//
//  Injection.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 23/04/21.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
  
  private func provideRepository() -> GameRepositoryProtocol {
    let realm  = try? Realm()
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
    let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
    return GameRepository.sharedInstance(remote, locale)
    
  }

  func provideGameVieModel() -> GameListViewModel {
    let repository = provideRepository()
    return GameListViewModel(repository: repository)
  }
    
    func provideDeveloperViewModel() -> DeveloperViewModel{
        let repo = provideRepository()
        return DeveloperViewModel(repository: repo)
    }
}
