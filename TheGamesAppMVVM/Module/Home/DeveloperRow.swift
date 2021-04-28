//
//  DeveloperRow.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 24/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DeveloperRow: View {
    var developer :DeveloperModel
    var body: some View {
        ZStack(alignment: .bottom, content: {
            image
            content
        })
        .frame(width: UIScreen.main.bounds.width * 0.50,
                 height: UIScreen.main.bounds.height * 0.20)
        .cornerRadius(24)
        .shadow(radius: 4)
    }
}

extension DeveloperRow{
    var image: some View{
        WebImage(url: URL(string: developer.imageUrl))
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width * 0.50,
                     height: UIScreen.main.bounds.height * 0.20)
            .cornerRadius(30)
            .padding(.top)
    }
    var content: some View{
        Text(developer.name)
            .font(.title3)
            .lineSpacing(5)
            .lineLimit(1)
            .padding()
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width * 0.50)
            .background(Color.black.opacity(0.5))
         
    }
}


struct DeveloperRow_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperRow(developer: DeveloperModel(id: 0, name: "asdfa", gamesCount: 0, imageUrl: "https://media.rawg.io/media/games/157/15742f2f67eacff546738e1ab5c19d20.jpg"))
    }
}
