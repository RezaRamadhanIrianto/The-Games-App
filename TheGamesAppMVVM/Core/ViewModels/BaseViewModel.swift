//
//  BaseViewModel.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 23/04/21.
//

import Foundation

enum LoadingState {
    case loading, success, loadingMore, failed, none
}


class BaseViewModel: ObservableObject {
    
    @Published var loadingState: LoadingState = .none
    
}
