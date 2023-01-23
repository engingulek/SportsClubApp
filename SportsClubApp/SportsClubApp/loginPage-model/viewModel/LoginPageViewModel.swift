//
//  LoginPageViewModel.swift
//  SportsClubApp
//
//  Created by engin gülek on 23.01.2023.
//

import Foundation

class LoginPageViewModel : ObservableObject {
    @Published var resultViewModel = ""
    let singInUpRef = UserDefaults.standard
    
    func loginAuthUser(email:String,password:String) async {
        
        do {
            await LoginPageService.loginPageService.loginAuth(email: email, password: password, completion: { (response:Result<Dictionary,Error>) in
                switch response {
                case .success(let resultDictionary) :
                    DispatchQueue.main.async {
                        
                        self.singInUpRef.set(resultDictionary["uid"], forKey: "uid")
                        
                        self.singInUpRef.set(resultDictionary["nameSurname"], forKey: "nameSurname")
                        
                        self.singInUpRef.set(resultDictionary["email"], forKey: "email")
                        self.resultViewModel = "Success"
                    }
                    
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.resultViewModel = error.localizedDescription
                    }
                    
                }
                
            })
        }
    }
    
    
}
