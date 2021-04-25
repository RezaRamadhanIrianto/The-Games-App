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
        HStack(alignment: .top){
            Group{
                image
            }
            Group{
                content
            }
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
            )
        .padding()
        .background(Rectangle().cornerRadius(30).foregroundColor(.white).shadow(radius: 3))
    }
}

extension DeveloperRow{
    var image: some View{
        WebImage(url: URL(string: developer.imageUrl))
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
            Text(developer.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 1)
//            Text(developer.gamesCount)
//                .font(.headline)
//                .fontWeight(.medium)
//                .padding(.bottom, 1)
            Text("\(developer.gamesCount)")
                .font(.title)
                .foregroundColor(.orange)
        }
        .padding(.top, 30)
    }
}


struct DeveloperRow_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperRow(developer: DeveloperModel(id: 0, name: "asdfa", gamesCount: 0, imageUrl: ""))
    }
}
