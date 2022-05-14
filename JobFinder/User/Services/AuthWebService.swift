//
//  AuthWebService.swift
//  AuthWebService
//
//  Created by Madhav Raj Verma on 09/01/22.
//

import SwiftUI
import Foundation



enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct LoginRequestBody: Codable {
    let email: String
    let password: String
}


struct RegisterRequestBody :Codable {
    let name:String
    let email:String
    let password:String
    let role:String
}


struct UserRole : Codable {
    let _id:String
    let role:String
}


struct LoginResponse2: Codable {
    let token: String?
    let success: Bool?
    let user:UserRole
}



struct LoginResponse: Decodable {
    let token: String?
    let success: Bool?
//    let user:UserModel?
}

struct LoginResult{
    let token:String
    let role:String
    let id:String
}


class AuthWebService {
    
    
    func  login(email :String ,password :String, completion : @escaping (Result<LoginResult,AuthenticationError>) -> Void) {
        
        let body = LoginRequestBody(email: email, password: password)
        
        
        guard let url = URL(string: "http://localhost:3000/api/v1/login") else {
                   completion(.failure(.custom(errorMessage: "URL is not correct")))
                   return
               }
        var request = URLRequest(url: url ,timeoutInterval: Double.infinity)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(body)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
          guard let data = data , error == nil else {
              completion(.failure(.custom(errorMessage: "No data")))
          
            return
          }
            
          
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse2.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }

            print(loginResponse.user.role)
            print(loginResponse.user._id)
           
            
            guard let token = loginResponse.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            let logInResult = LoginResult(token: token, role: loginResponse.user.role,id:loginResponse.user._id)
            completion(.success(logInResult))
            
        
        }

        task.resume()
       
    }
    
    
    
    func  signUp(name:String ,email :String ,password :String,role:String, completion : @escaping (Result<String,AuthenticationError>) -> Void) {
        
        let body = RegisterRequestBody(name:name ,email:email, password: password, role: role)
        
        
        guard let url = URL(string: "http://localhost:3000/api/v1/register") else {
                   completion(.failure(.custom(errorMessage: "URL is not correct")))
                   return
               }

       


        var request = URLRequest(url: url ,timeoutInterval: Double.infinity)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(body)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
          guard let data = data , error == nil else {
              completion(.failure(.custom(errorMessage: "No data")))
         
            return
          }
          
        
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let token = loginResponse.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(token))
            
      
        }

        task.resume()
      
    }
    
    
    
    
    
}
