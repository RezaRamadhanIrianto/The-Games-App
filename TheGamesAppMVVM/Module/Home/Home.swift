//
//  Home.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 23/04/21.
//

import SwiftUI

struct Home: View {
    @ObservedObject var gameViewModel: GameListViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                 if gameViewModel.loadingState == LoadingState.loading {
                     Text("Loading")
                     ActivityIndicator()
                 } else if gameViewModel.loadingState == LoadingState.success {
                     ScrollView(.vertical, showsIndicators: false) {
                         ForEach(
                             gameViewModel.games,
                             id: \.id
                         ) { game in
                           ZStack {
                               GameRow(game: game)
                           }.padding(8)
                         }
                     }
                 }
             
            }
            .navigationBarTitle(
              Text("Games Apps"),
              displayMode: .automatic
            )
            .onAppear{
                if self.gameViewModel.games.count == 0{
                    self.gameViewModel.getGames()
                }
            }
        }
       
    }
}
