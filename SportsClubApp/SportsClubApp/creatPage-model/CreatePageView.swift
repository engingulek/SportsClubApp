//
//  CreatePageView.swift
//  SportsClubApp
//
//  Created by engin gülek on 1.01.2023.
//

import SwiftUI

struct CreatePageView: View {
    @State private var emailTextField : String = ""
    @State private var passwordTextField : String = ""
    @State private var reEnterpasswordTextField : String = ""
    var body: some View {
        VStack(spacing : 25) {
            Image("createPageImage")
                .resizable()
                .scaledToFill()
                .frame(width: 230,height: 230)
                .cornerRadius(20)
            
            Text("Register Now")
                .font(.system(size: 30,weight: .bold))
            
            TextField("Email", text: $emailTextField)
                .asTextField(textContentType: .emailAddress)
            
            SecureField("Password", text: $passwordTextField)
                .asTextField(textContentType: .password)
            
            SecureField("Re-enter Password", text: $reEnterpasswordTextField)
                .asTextField(textContentType: .password)
            
            Button("Register", action: {
                
            })
            .buttonStyle(LoginPageButtonStyle(foregroundColor: .white, backgroundColor: .red))
            
          
    
        }.padding(.horizontal)
    }
}

struct CreatePageView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePageView()
    }
}
