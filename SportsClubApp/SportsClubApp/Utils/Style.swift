//
//  Style.swift
//  SportsClubApp
//
//  Created by engin gülek on 13.01.2023.
//

import SwiftUI

extension View {
    
    func asTextFiedlDescription(_ textDescriptionContentType : UITextContentType) -> some View {
        modifier(DescriptionTextFieldModifier(textDescriptionContentType: textDescriptionContentType))
    }
    
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


struct DescriptionTextFieldModifier : ViewModifier {
    let textDescriptionContentType : UITextContentType
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: UIScreen.screenWidth/1.5,height: UIScreen.screenHeight / 8)
            .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(15)
            .padding(.horizontal)
            .multilineTextAlignment(.center)
            .textContentType(textDescriptionContentType)
            
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



