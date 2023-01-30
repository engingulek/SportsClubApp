//
//  ChooseMapPinDesign.swift
//  SportsClubApp
//
//  Created by engin gülek on 11.01.2023.
//

import SwiftUI

struct ChooseMapPinDesign: View {
    @State var imageName : String

    @State var imageColor:Color
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .foregroundColor(imageColor)
                .font(.system(size: 25))
            Text("Select Location")
                .font(.system(size: 18))
        }
        
    }
}


