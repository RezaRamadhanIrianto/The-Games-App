//
//  Injection.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 23/04/21.
//

import Foundation

final class Injection: NSObject {
  
  private func provideRepository() -> GameRepositoryProtocol {
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
    return GameRepository.sharedInstance(remote)
    
  }

  func provideGameVieModel() -> GameListViewModel {
    let repository = provideRepository()
    return GameListViewModel(repository: repository)
  }
}
