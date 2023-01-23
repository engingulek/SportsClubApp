//
//  CreatePageView.swift
//  SportsClubApp
//
//  Created by engin gülek on 1.01.2023.
//

import SwiftUI

struct CreatePageView: View {
    @ObservedObject var createPageViewModel = CreatePageViewModel()
    @State private var emailTextField : String = ""
    @State private var nameSurnameTextField : String = ""
    @State private var passwordTextField : String = ""
    @State private var selected = 0
    @State private var errorMessage  = ""
    @State private var toHomePage = false
    var body: some View {
        VStack(spacing : 25) {
       
           
            Text("Register Now")
                .font(.system(size: 30,weight: .bold))
           
            TextField("Name Surname", text: $nameSurnameTextField)
                .asTextField(textContentType: .name)
            TextField("Email", text: $emailTextField)
                .asTextField(textContentType: .emailAddress)
           
            SecureField("Password", text: $passwordTextField)
                .asTextField(textContentType: .password)
        
            Button("Register", action: {
                createPageViewModel.createUserAuth(nameSurname: nameSurnameTextField, email: emailTextField, password: passwordTextField)
                print(createPageViewModel.resultAuthMessage.count)
                if createPageViewModel.resultAuthMessage.count == 0 {
                    self.toHomePage = true
                }
            }).fullScreenCover(isPresented: $toHomePage , content: {
                HomePageView()
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
