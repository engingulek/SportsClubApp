//
//  LoginPageView.swift
//  SportsClubApp
//
//  Created by engin gülek on 31.12.2022.
//

import SwiftUI

struct LoginPageView: View {
    @ObservedObject var loginPageViewModel = LoginPageViewModel()
    @State private var emailTextField : String = ""
    @State private var passwordTextField : String = ""
    @State private var createPage = false
    @State private var showingAlertEmpty = false
    @State private var toHomePage = false
    @State private var showAlertControl = false
    var body: some View {
        VStack(spacing : 25) {
           
                
            
            Image("sports person")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.screenWidth/2,height: UIScreen.screenHeight/3.5)
                .cornerRadius(20)

            TextField("Email", text: $emailTextField)
                .asTextField(textContentType: .emailAddress)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
            
            SecureField("Password", text: $passwordTextField)
                .asTextField(textContentType: .password)
            
            Button("Sing In", action: {
                if emailTextField.isEmpty || passwordTextField.isEmpty {
                    print(emailTextField)
                    self.showingAlertEmpty = true
                }else{
                    Task {
                        await loginPageViewModel.loginAuthUser(email:emailTextField, password:passwordTextField)
                        if self.loginPageViewModel.resultViewModel != "Success" {
                            self.showAlertControl = true
                        }else{
                            self.toHomePage = true
                        }
                    }
                }
            })
            .fullScreenCover(isPresented: $toHomePage , content: {
                HomePageView()
            })
            .buttonStyle(LoginPageButtonStyle(foregroundColor: .white, backgroundColor: .black))
            .alert(isPresented: $showAlertControl) {
                Alert(title: Text("Warning"), message: Text(self.loginPageViewModel.resultViewModel), dismissButton: .default(Text("Okey")))}
            .alert(isPresented: $showingAlertEmpty) {
                Alert(title: Text("Warning"), message: Text("Fill in the blanks"), dismissButton: .default(Text("Okey")))}

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
