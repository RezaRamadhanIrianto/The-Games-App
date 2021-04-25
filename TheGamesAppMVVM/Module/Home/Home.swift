//
//  Home.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 23/04/21.
//

import SwiftUI

struct Home: View {
    @ObservedObject var gameViewModel = Injection.init().provideGameVieModel()
    @ObservedObject var developerViewModel = Injection.init().provideDeveloperViewModel()
    @State var page: Int = 1;
    
    var body: some View {
        NavigationView{
            VStack{
                 if gameViewModel.loadingState == LoadingState.loading {
                     Text("Loading")
                     ActivityIndicator()
                 }else{
                     ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack{
                            ForEach(
                                gameViewModel.games,
                                id: \.id
                            ) { game in
                              ZStack {
                               NavigationLink(destination: DetailGame(game: game)){
                                   GameRow(game: game)
                                       .onAppear{
                                           if(gameViewModel.games.last?.id == game.id){
                                                if gameViewModel.loadingState != LoadingState.loadingMore{
                                                    self.page += 1;
                                                }
                                            
                                                self.gameViewModel.getGames(page: page)
                                                
                                           }
                                       }
                               }
                              }.padding(8)
                            }
                            
                            if gameViewModel.loadingState == LoadingState.loadingMore{
                                ActivityIndicator()
                            }
                        }
                     }
                 }
//
//                if developerViewModel.loadingState == LoadingState.loading{
//                    Text("Loading")
//                    ActivityIndicator()
//                } else if developerViewModel.loadingState == LoadingState.success{
//                ScrollView(.vertical, showsIndicators: false) {
//                    ForEach(
//                        developerViewModel.developers,
//                        id: \.id
//
//                    ){
//                        dev in
//                        ZStack {
//
//                            DeveloperRow(developer: dev)
//
//                        }.padding(8)
//                    }
//                }
//                }
            }.onAppear{
                if self.gameViewModel.games.count == 0{
                    self.gameViewModel.getGames(page: page)
                }
//                if self.developerViewModel.developers.count == 0{
//                    self.developerViewModel.getDev()
//                }
            }
        }
       
    }
}
