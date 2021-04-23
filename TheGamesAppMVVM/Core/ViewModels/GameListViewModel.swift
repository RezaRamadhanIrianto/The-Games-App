//
//  GameListViewModel.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 23/04/21.
//

import Foundation
import RxSwift

class GameListViewModel: BaseViewModel{
    @Published var games = [GameModel]()
    private let repository: GameRepositoryProtocol
    private let disposeBag = DisposeBag()
    
    required init(repository: GameRepositoryProtocol){
        self.repository = repository
    }
    
    func getGames(){
        self.loadingState = .loading
        
        repository.getGames()
            .observe(on: MainScheduler.instance)
            .subscribe{
                result in
                self.games = result
            } onError: { error in
                print(error.localizedDescription)
            } onCompleted: {
                self.loadingState = .success
            }.disposed(by: disposeBag)
    }
}


