//
//  ButtonStyle.swift
//  SportsClubApp
//
//  Created by engin gülek on 31.12.2022.
//

import SwiftUI

struct StartPageButtonStyle: ButtonStyle  {
    let foregroundColor : Color
    let backgroundColor : Color
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .padding()
            .frame(width: 300)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(12)
    }
}





