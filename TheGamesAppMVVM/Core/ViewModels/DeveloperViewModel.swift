//
//  DeveloperViewModel.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 24/04/21.
//

import Foundation
import RxSwift

class DeveloperViewModel: BaseViewModel{
    @Published var developers = [DeveloperModel]()
    private let repository: GameRepositoryProtocol
    private let disposeBag = DisposeBag()
    
    required init(repository: GameRepositoryProtocol){
        self.repository = repository
    }
    
    func getDev(){
        self.loadingState = .loading
        
        repository.getDevelopers()
            .observe(on: MainScheduler.instance)
            .subscribe{
                result in
                self.developers = result
            } onError: { error in
                print(error.localizedDescription)
            } onCompleted: {
                self.loadingState = .success
            }.disposed(by: disposeBag)
    }
}


