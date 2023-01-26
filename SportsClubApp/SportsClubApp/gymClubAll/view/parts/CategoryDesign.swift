//
//  CategoryDesign.swift
//  SportsClubApp
//
//  Created by engin gülek on 3.01.2023.
//

import SwiftUI

struct CategoryDesign: View {
    @State var name : String
    @State var backgroundColor : Color
    @State var forgroundColor : Color
    var body: some View {
        Text(name)
            .padding()
            .background(backgroundColor)
            .foregroundColor(forgroundColor)
            .border(.black,width: 2)
            
            .cornerRadius(5)
    }
}

struct CategoryDesign_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDesign(name: "name",backgroundColor: .white,forgroundColor: .black)
    }
}
