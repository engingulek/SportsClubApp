//
//  ChooseMapPinDesign.swift
//  SportsClubApp
//
//  Created by engin gülek on 11.01.2023.
//

import SwiftUI

struct ChooseMapPinDesign: View {
    @State var imageName : String
    @State var text:String
    @State var imageColor:Color
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .foregroundColor(imageColor)
                .font(.system(size: 25))
            Text(text)
                .font(.system(size: 18))
        }
        
    }
}

struct ChooseMapPinDesign_Previews: PreviewProvider {
    static var previews: some View {
        ChooseMapPinDesign(imageName: "circle.circle", text: "Your Location",imageColor: .blue)
    }
}
