//
//  ContentView.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 23/04/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameViewModel: GameListViewModel
    
    var body: some View {
        Home(gameViewModel: gameViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
