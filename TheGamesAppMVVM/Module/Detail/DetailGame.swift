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
            image
            content
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
            .frame(width: 130, height: 200)
            .cornerRadius(30)
            .padding(.top)
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
            Label("\(game.rating)", systemImage: "star.fill")
                .font(.title)
                .foregroundColor(.orange)
        }
        .padding(.top, 30)
    }
}
