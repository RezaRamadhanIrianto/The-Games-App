//
//  DetailGame.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 24/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailGame: View {
    var game: GameModel
    var body: some View {
        VStack{
            ZStack{
//                Color(.red).ignoresSafeArea()
                VStack{
                    image
                    VStack(alignment: .leading){
                        Text(game.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom)
                        
                        HStack(spacing: 6){
                            ForEach(0 ..< 5){
                                item in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                            Text("( \(String(format: "%.2f", game.rating)) )")
                            Spacer()
                        }
                        
                        Text("\(game.released)")
                            .font(.subheadline)
                            .padding(.top, 5)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(40)
                    .offset(y: -40)
                }
                
                Group{
                    Image(systemName: "heart")
                        .foregroundColor(Color.pink)
                        .font(.system(size: 50))
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .offset(x: UIScreen.main.bounds.width / 2 - 100, y: UIScreen.main.bounds.width / 2)
            }
        }
    }
}

extension DetailGame{
    var image: some View{
        WebImage(url: URL(string: game.imageUrl))
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.70)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    var content: some View{
        VStack(alignment: .leading){
            Text(game.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 1)
            Text(game.released)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.bottom, 1)
//            Label("\(game.rating)", systemImage: "star.fill")
//                .font(.title)
//                .foregroundColor(.orange)
        }.padding()
        
    }
}

struct DetailGame_Previews: PreviewProvider {
    static var previews: some View{
        DetailGame(game: GameModel(id: 10, name: "GTA", released: "2020", imageUrl: "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/06/12/3145180756.jpg", rating: 2.9))
    }
}
