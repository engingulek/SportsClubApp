//
//  CreatePageViewModel.swift
//  SportsClubApp
//
//  Created by engin gülek on 23.01.2023.
//

import Foundation

class CreatePageViewModel : ObservableObject {
    @Published var resultAuthMessage = ""
    
    func createUserAuth(nameSurname:String,email:String,password:String) async  {
        
        do {
             await CreatePageService.createPageService.createAuth(nameSurname: nameSurname, email: email, password: password, completion: { (response:Result<String,Error>) in
                switch response {
                case .success(let message):
                    DispatchQueue.main.async {
                        self.resultAuthMessage = message
                        print("VM \(self.resultAuthMessage)")
                    }
                    
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.resultAuthMessage = error.localizedDescription
                        print("VM \(self.resultAuthMessage)")
                    }
                    
                    
                }
            })
        }
        
        
        
        
       /* await CreatePageService.createPageService.createAuth(nameSurname: nameSurname, email: email, password: password) { (response:Result<String?,Error>) in
            switch response {
            case .success(let message):
                
                    self.resultAuthMessage = message!
                
                print("View model \(String(describing: message))")
            case .failure(let error):
               
                    self.resultAuthMessage = error.localizedDescription
                
                
                print("View model \(self.resultAuthMessage)")
            }
        }*/
    }
}
