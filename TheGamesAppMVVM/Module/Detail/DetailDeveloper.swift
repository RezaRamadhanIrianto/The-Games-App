//
//  DetailDeveloper.swift
//  TheGamesAppMVVM
//
//  Created by Reza Ramadhan Irianto on 28/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailDeveloper: View {
    var developer: DeveloperModel
    var body: some View {
        VStack{
            image
            content
        }
    }
}

extension DetailDeveloper{
    var image: some View{
        WebImage(url: URL(string: developer.imageUrl))
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.80)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    var content: some View{
        VStack(alignment: .leading){
            Text(developer.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 1)
        }.padding()
        
    }
}

struct DetailDeveloper_Previews: PreviewProvider {
    static var previews: some View {
        DetailDeveloper(developer: DeveloperModel(id: 1, name: "adf", gamesCount: 10, imageUrl: "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/06/12/3145180756.jpg"))
    }
}
