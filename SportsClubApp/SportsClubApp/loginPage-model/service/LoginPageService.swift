//
//  LoginPageService.swift
//  SportsClubApp
//
//  Created by engin gülek on 23.01.2023.
//

import Foundation
import FirebaseAuth
struct LoginPageService {
    static let loginPageService = LoginPageService()
    
    func loginAuth(email:String,password:String,completion:@escaping(Result<Dictionary<String, Any>,Error>)->()) async {
        var sendResult : [String:Any] = [
            "uid":"",
            "nameSurname" : "",
            "email" : "",
        ]
     
        do {
            _ = try await Auth.auth().signIn(withEmail: email, password: password)
            let auth = Auth.auth().currentUser
            sendResult["uid"] = auth?.uid
            sendResult["nameSurname"] = auth?.displayName
            sendResult["email"] = auth?.email
            completion(.success(sendResult))
        }catch{
            completion(.failure(error))
        }
        
    }
    
    
    //MARK: -Second Way
    /**func loginAuth(email:String,password:String) async throws -> Dictionary<String, Any> {
        var sendResult : [String:Any] = [
            "uid":"",
            "nameSurnama" : "",
            "email" : "",
        ]
        var errorSendResult : [String:Any] = [
            "errorMessage" : ""
        ]
        
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
            let auth = Auth.auth().currentUser
            sendResult["uid"] = auth?.uid
            sendResult["name"] = auth?.displayName
            sendResult["email"] = auth?.email
            return sendResult
            
        }catch{
          
            errorSendResult["errorMessage"] = error.localizedDescription
            print(error.localizedDescription)
            return errorSendResult
        }
        
        
    }**/
}
