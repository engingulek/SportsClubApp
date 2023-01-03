//
//  CommentDesign.swift
//  SportsClubApp
//
//  Created by engin gülek on 3.01.2023.
//

import SwiftUI

struct CommentDesign: View {

    private let rating  = 3
    var body: some View {
        VStack(spacing:15) {
            HStack {
                VStack {
                    Text("John Darke")
                        .fontWeight(.semibold)
                    Text("03/01/2023")
                }
                Spacer()
                ForEach(0..<rating, id: \.self) {_  in
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                }
                ForEach(0..<5-rating, id: \.self) {_  in
                    Image(systemName: "star.fill")
                        .foregroundColor(.gray)
                }
            }
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                .multilineTextAlignment(.leading)
        }.padding()
            .border(.black)
            .padding()
            
         
    }
}

struct CommentDesign_Previews: PreviewProvider {
    static var previews: some View {
        CommentDesign()
    }
}
