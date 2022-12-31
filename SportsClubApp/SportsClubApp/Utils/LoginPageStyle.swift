//
//  LoginPageStyle.swift
//  SportsClubApp
//
//  Created by engin gülek on 31.12.2022.
//

import SwiftUI

extension View {
    func asTextField(textContentType : UITextContentType) -> some View {
        modifier(TextFieldModifier(textContentType: textContentType))
    }
}

struct TextFieldModifier: ViewModifier {
    let textContentType : UITextContentType
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(15)
            .padding(.horizontal)
            .multilineTextAlignment(.center)
            .textContentType(textContentType)
    }
}

struct LoginPageButtonStyle: ButtonStyle  {
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




