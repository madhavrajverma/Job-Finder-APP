//
//  UserViewModel.swift
//  UserViewModel
//
//  Created by Madhav Raj Verma on 20/01/22.
//

import Foundation
import Alamofire
import UIKit
import SwiftUI



struct UpdateModelBody: Encodable {
    let  name:String
    let email:String
}

struct UpdateModelRespne : Decodable {
    let success :Bool
}

struct UploadImageResponse :Decodable {
    let success :Bool
}


class UserViewModel :ObservableObject {
    
    @Published var user : UserModel?
    @Published var isSuccess :Bool = false
    @Published var allApplications : [Job] = []
    @Published var isSuccefullyUploadImage:Bool = false
    @Published var uploadResponse: Bool = false
    
    
    init() {
        getUser()
    }
    
    
    
    // function to get user information  like email images password
    
    func getUser() {
        
        let defaults = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/v1/me")!,timeoutInterval: Double.infinity)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
          
            return
          }
            let userData = try? JSONDecoder().decode(UserResponse.self, from: data)
            DispatchQueue.main.async {
                if let userData = userData {
                    self.user = userData.data
                }
            }
         
        }

        task.resume()
       
    }
    
    
    
    // function to update a user profile means email and name of a user
    
    func updateUserProfile(_ name :String , email :String, completion :@escaping () -> Void) {
        
        let body = UpdateModelBody(name: name, email: email)
    
        let defaults = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/v1/me/update")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer \(token) ", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "PUT"
        request.httpBody = try? JSONEncoder().encode(body)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            let  decodedData = try? JSONDecoder().decode(UpdateModelRespne.self, from: data)
            
            if let decodedData = decodedData {
                DispatchQueue.main.async {
                    self.isSuccess = decodedData.success
                    
                }
             }
          
        }
        task.resume()
    }
    
    // function to get all jobs applied by a user
    
    func getUserApplication() {
        
        let defaults = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/v1/jobs/applied")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
       

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
          
            return
          }
            let applicationResults =  try? JSONDecoder().decode(JobResult.self, from: data)
            DispatchQueue.main.async {
                if let applicationResult = applicationResults {
                    self.allApplications = applicationResult.data
                }
            }
         
        }

        task.resume()
    }
    
    func chnageProfilePic(_ file: Data,filename : String, fileExt:String , handler : @escaping (Result<Bool,Error>) -> Void) {
    
        
        var ext: String = ""
        
        if fileExt == "png" {
            ext = "image/png"
        }else if fileExt == "jpeg"  {
            ext = "image/jpeg"
        }else if fileExt == "jpg" {
            ext = "image/jpg"
        }
        
        print(ext)
        
        let defaults = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
          let headers: HTTPHeaders = [
              "Content-type": "multipart/form-data",
              "Authorization" : "Bearer \(token)"
          ]
       
   
        
        guard  let url  = URL(string: "http://localhost:3000/api/v1/me/update/image") else {
            return
        }
        print(url)
        
          AF.upload(
              multipartFormData: { multipartFormData in
                  multipartFormData.append(file, withName: "file" , fileName: filename,mimeType: ext)
          },
              to: url, method: .put , headers: headers)
              .response { response in
                  if let data = response.data {
                      let decodedData = try? JSONDecoder().decode(UploadImageResponse.self, from: data)
                      DispatchQueue.main.async {
                          if  let decodedData = decodedData {
//                              self.uploadResponse = decodedData.success
                              handler(.success(decodedData.success))
                              print(decodedData.success)
                              self.getUser()
                          }
                      }
                  }

          }
      }
    
}
