//
//  CreatePageService.swift
//  SportsClubApp
//
//  Created by engin gülek on 23.01.2023.
//

import Foundation
import FirebaseAuth
struct CreatePageService {
    static let createPageService = CreatePageService()
    
    // MARK: - Create auth service from firebae auth
    
    func createAuth(nameSurname:String,email:String,password:String,completion:@escaping(Result<String,Error>)->()) async {
        do {
            let createUserAuth = try await Auth.auth().createUser(withEmail: email, password: password)
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = nameSurname
            completion(.success("Success"))
            print("S Success")
        }catch{
            completion(.failure(error))
            print("S \(error.localizedDescription)")
        }
        
        
        
        
        /*Auth.auth().createUser(withEmail: email, password: password) { (authData,error) in
            print("Service \(email)")
            if error != nil {
                print("Auth Result: Create auth error \(error?.localizedDescription)")
                completion(.failure(error!))

            }else {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = nameSurname
                changeRequest?.commitChanges(completion: { error in
                    if error == nil {
                        completion(.success("Success"))
                    }
                })
                
            }
        
        }*/
    }
}

/**
 
 

 
 **/
