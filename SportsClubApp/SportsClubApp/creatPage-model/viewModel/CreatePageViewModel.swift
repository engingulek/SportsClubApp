//
//  CreatePageViewModel.swift
//  SportsClubApp
//
//  Created by engin gülek on 23.01.2023.
//

import Foundation

class CreatePageViewModel : ObservableObject {
    @Published var resultAuthMessage = ""
    
    func createUserAuth(nameSurname:String,email:String,password:String){
        CreatePageService.createPageService.createAuth(nameSurname: nameSurname, email: email, password: password) { (response:Result<String?,Error>) in
            switch response {
            case .success(let message):
                self.resultAuthMessage = message ?? "Success auth"
            case .failure(let error):
                self.resultAuthMessage = error.localizedDescription
            }
        }
    }
}
