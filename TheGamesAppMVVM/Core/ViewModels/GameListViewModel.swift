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
    
    func getGames(page: Int){
        print(page)
        if page == 1 {
            self.loadingState = .loading
        }else{
            self.loadingState = .loadingMore
        }
        
        repository.getGames(page: page)
            .observe(on: MainScheduler.instance)
            .subscribe{
                result in
                self.games.append(contentsOf: result)
            } onError: { error in
                self.loadingState = .failed
                print(error.localizedDescription)
            } onCompleted: {
                self.loadingState = .success
            }.disposed(by: disposeBag)
    }
}


