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
    @State private var errorMessage = ""
    @State private var toHomePage = false
    @State private var showingAlert = false
    @State private var showingAlertTwo = false
    
    var body: some View {
        VStack(spacing : 25) {
       
           
            Text("Register Now")
                .font(.system(size: 30,weight: .bold))
           
            TextField("Name Surname", text: $nameSurnameTextField)
                .asTextField(textContentType: .name)
                .textInputAutocapitalization(.words)
                
            TextField("Email", text: $emailTextField)
                .asTextField(textContentType: .emailAddress)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                
           
            SecureField("Password", text: $passwordTextField)
                .asTextField(textContentType: .password)
            HStack {
                Spacer()
            }.padding(.horizontal)
       
            Button("Register",  action: {
                if nameSurnameTextField == "" || emailTextField == "" || passwordTextField == "" {
                    self.errorMessage = "Filling in the blanks"
                    self.showingAlertTwo = true
                } else if !passwordTextField.isValidPassword()
                {
                    self.errorMessage = "Use special characters in password"
                    self.showingAlertTwo = true
                }else {
                    Task {
                        await createPageViewModel.createUserAuth(nameSurname: nameSurnameTextField, email: emailTextField, password: passwordTextField)
                       
                        if self.createPageViewModel.resultAuthMessage != "Success" {
                            self.showingAlert = true
                        }else{
                            self.toHomePage = true
                        }
                        print("Va \(self.createPageViewModel.resultAuthMessage)")
                        
                    }
                }
            }).fullScreenCover(isPresented: $toHomePage , content: {
                HomePageView()
            })
            .buttonStyle(LoginPageButtonStyle(foregroundColor: .white, backgroundColor: .red))
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error Message"), message: Text(self.createPageViewModel.resultAuthMessage), dismissButton: .default(Text("Okey")))
                   }
            
            alert(isPresented: $showingAlertTwo) {
                Alert(title: Text("Warning"), message: Text("Fill in the blanks"), dismissButton: .default(Text("Okey")))
                   }
        }.padding(.horizontal)
    }
}

struct CreatePageView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePageView()
    }
}
