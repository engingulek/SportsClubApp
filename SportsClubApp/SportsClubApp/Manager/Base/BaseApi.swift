//
//  BaseApi.swift
//  SportsClubApp
//
//  Created by engin gülek on 24.01.2023.
//

import Foundation
import Alamofire

class BaseApi {
    static let baseApi = BaseApi()
    func fetchData<M : Codable>(target:Network,responseClass:M.Type,completion:@escaping(Result<[M]?,Error>)->Void){
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let parameters = buildParams(requestType: target.requestType)
        AF.request(target.baseURL + target.path,method: method,parameters: parameters.0,encoding: parameters.1,headers: headers).response{
            (response) in
           
            
            if let data = response.data{
                do{
                    let result = try JSONDecoder().decode(DataResult<M>.self, from: data)
                    completion(.success(result.list))
                }catch{
                    completion(.failure(error))
                }
            }
        }
    }
    
    /*func sendData(target:Network,completion:@escaping(Result<String,Error>)->Void){
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let parameters = buildParams(requestType: target.requestType)
        AF.request(target.baseURL + target.path,method: method,parameters: parameters.0,encoding: parameters.1,headers: headers){
            (response) in
            
            
            if let data = response.data{
                do{
                    let result = try JSONDecoder().decode(DataResult<M>.self, from: data)
                    completion(.success(result.list))
                }catch{
                    completion(.failure(error))
                }
            }
        }
    }*/
    
    func sendData(target:Network,completion:@escaping(Result<String,Error>)->()) {
        print("Base Api send data")
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        print("request \(target.requestType)")
        let parameters = buildParams(requestType: target.requestType)
        
        print("parameters 0 \(parameters.0)")
        print("parameters 1 \(parameters.1)")
        print("request \(target.requestType)")
      
        AF.request(target.baseURL + target.path,method: method,parameters: parameters.0,encoding: parameters.1).response{ response in
           
                    if let data = response.data {
                        do {
                            let result = try JSONDecoder().decode(SendResultData.self, from: data)
                           // let result = try JSONSerialization.jsonObject(with: data)
                            completion(.success(result.message!))
                            print(result)
                        }catch{
                            print("Send Data Error \(error.localizedDescription)")
                            completion(.failure(error))
                        }
                    }
                }
        /**
         
         
         AF.request(url,method: .post,parameters: params,encoding: JSONEncoding.init()).response{ response in
                     if let data = response.data {
                         do {
                             let result = try JSONDecoder().decode(SendDataResult.self, from: data)
                            // let result = try JSONSerialization.jsonObject(with: data)
                             completion(.success(result.success))
                             print(result)
                         }catch{
                             print("Send Data Error \(error.localizedDescription)")
                             completion(.failure(error))
                         }
                     }
                 }
         */
        
    }

    
    
   
    
    
    
    private func buildParams(requestType: RequestType) -> ([String: Any], ParameterEncoding) {
        
        switch requestType {
            
        case .requestPlain:
            print("Test 1")
            return ([:], URLEncoding.default)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            print("Test")
            return (parameters, encoding)
        }
    }
}
