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
           
          /*guard let statusCode = response.response?.statusCode else {
               completion(.failure(NSError()))
               return
           }
           if statusCode == 200 {
               guard let jsonResponse = try? response.result.get() else {
                   print("jsonResponse error")
                   completion(.failure(NSError()))
                   return
               }
               guard let theJSONData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else {
                   print("theJSONData error")
                   completion(.failure(NSError()))
                   return
               }
               guard let responseObj = try? JSONDecoder().decode(DataResult<M>.self, from: theJSONData) else {
                   print("responseObj error")
                   completion(.failure(NSError()))
                   return
               }
               completion(.success(responseObj.list))
               print("Base Ap veri \(responseObj.list)")
           }else{
               print("error statusCode is \(statusCode)")
               completion(.failure(NSError()))
           }*/
           
       }
       
    }
}



private func buildParams(requestType: RequestType) -> ([String: Any], ParameterEncoding) {
    
    switch requestType {
        
    case .requestPlain:
        return ([:], URLEncoding.default)
    case .requestParameters(parameters: let parameters, encoding: let encoding):
        return (parameters, encoding)
    }
}
