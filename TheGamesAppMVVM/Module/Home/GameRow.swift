//
//  GameRow.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 23/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameRow: View {
    var game :GameModel
    var body: some View {
        VStack{
            ZStack(alignment: .bottom, content: {
                image
                content
            })
            .frame(width: UIScreen.main.bounds.width * 0.30,
                     height: UIScreen.main.bounds.height * 0.25)
            .cornerRadius(24)
            .shadow(radius: 4)
            
            Text(game.name)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(Color.black)
                .frame(width: UIScreen.main.bounds.width * 0.25)
                .lineLimit(1)
        }
    }
}

extension GameRow{
    var image: some View{
        WebImage(url: URL(string: game.imageUrl))
            .resizable()
            .indicator(.activity)
            .aspectRatio(contentMode: .fill)
    }
    var content: some View{
        Text(game.released)
            .font(.caption2)
            .lineSpacing(5)
            .lineLimit(4)
            .padding()
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width * 0.30)
            .background(Color.black.opacity(0.5))
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View{
        GameRow(game: GameModel(id: 10, name: "GTA", released: "2020", imageUrl: "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/06/12/3145180756.jpg", rating: 2.9))
    }
}
