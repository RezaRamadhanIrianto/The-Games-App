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
            VStack(alignment: .leading){
                favorite
                
                Text("LIST OF GAMES")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.leading, 10)
                ScrollView(.horizontal, showsIndicators: false) {
                    if gameViewModel.loadingState == LoadingState.loading {
                        ActivityIndicator()
                    }else{
                        LazyHStack{
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
                                }.padding(2)
                            }
                            if gameViewModel.loadingState == LoadingState.loadingMore{
                                ActivityIndicator()
                            }
                        }
                        
                        
                    }
                }.frame(height: UIScreen.main.bounds.height * 0.28)
                .onAppear{
                    if self.gameViewModel.games.count == 0{
                        self.gameViewModel.getGames(page: page)
                    }
                }
                Spacer()
            }
            //        .navigationBarTitleDisplayMode(.inline)
            //                .toolbar { // <2>
            //                    ToolbarItem(placement: .principal) { // <
            //                            HStack{
            //                                Image(systemName: "line.horizontal.3.decrease")
            //                                    .resizable()
            //                                    .frame(width: 24, height: 24, alignment: .leading)
            //                                Spacer()
            //                                Spacer()
            //                                Text("The Games").font(.system(.headline, design: .rounded))
            //                                Text("App").fontWeight(.ultraLight)
            //                                Spacer()
            //                            }.padding()
            //                    }
            //                }
            //                        .toolbar {
            //                            ToolbarItemGroup(placement: .navigationBarTrailing) {
            //                                Button("About") {
            //                                    print("About tapped!")
            //                                }
            //
            //                                Button("Help") {
            //                                    print("Help tapped!")
            //                                }
            //                            }
            //                        }
            
            .navigationBarTitle("Games App",displayMode: .inline)
            .navigationBarItems(leading:
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                        Image(systemName: "line.horizontal.3.decrease")
                                            .resizable()
                                            .frame(width: 18, height: 18, alignment: .leading)
                                            .foregroundColor(Color.black)
                                    })
            )
        }
    }
}

extension Home{
    var favorite: some View{
        HStack{
            HStack{
                Image(systemName: "heart.fill")
                    .foregroundColor(Color(UIColor.systemPink)).padding()
                Divider().frame(height: 24)
                Spacer()
                Text("See Your Favorite Game")
                    .foregroundColor(Color(UIColor.systemPink))
                Spacer()
                Divider().frame(height: 24)
                Image(systemName: "heart.fill")
                    .foregroundColor(Color(UIColor.systemPink)).padding()
            }.foregroundColor(Color.secondary.opacity(0.5)).background(Color.gray.opacity(0.1)).cornerRadius(80).shadow(radius: 1).padding()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View{
        Home()
    }
}
