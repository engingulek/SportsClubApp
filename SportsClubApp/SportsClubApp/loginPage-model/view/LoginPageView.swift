//
//  LoginPageView.swift
//  SportsClubApp
//
//  Created by engin gülek on 31.12.2022.
//

import SwiftUI

struct LoginPageView: View {
    @State private var emailTextField : String = ""
    @State private var passwordTextField : String = ""
    @State private var createPage = false
    @State private var selected = 0

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing : 25) {
           
                
            
            Image("sports person")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.screenWidth/2,height: UIScreen.screenHeight/3.5)
                .cornerRadius(20)

            TextField("Email", text: $emailTextField)
                .asTextField(textContentType: .emailAddress)
            
            SecureField("Password", text: $passwordTextField)
                .asTextField(textContentType: .password)
            
            Button("Sing In", action: {
                
            })
            .buttonStyle(LoginPageButtonStyle(foregroundColor: .white, backgroundColor: .black))
            
            HStack{
                Text("Don't have an account")
                Text("Register")
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .onTapGesture {
                        self.createPage = true
                    }
                    .sheet(isPresented: $createPage) {
                        CreatePageView()
                    }
            }
    
        }.padding(.horizontal)
            
    }
}

struct PersonLoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        
    LoginPageView()
        
    }
}
