//
//  AddPostViewModel.swift
//  JobFinder
//
//  Created by Lakshya  Verma on 03/05/22.
//

import SwiftUI
import Alamofire


struct UploadCompanyImageResponse :Decodable {
    let success:Bool
    let  imageUrl:String
}

struct PostData:Codable {
    let title:String
    let description:String
    let email:String
    let address:String
    let company:String
    let industry:[String]
    let jobType:String
    let minEducation:String
    let positions:Int
    let experience:String
    let salary:String
    let companyImage:String
}


struct UploadPostResponse:Codable {
    let success:Bool
}


class AddPostViewModel:ObservableObject {
    
    @Published  var title = ""
    @Published  var email = ""
    @Published  var company = ""
    @Published  var description = ""
    @Published  var address = ""
    @Published  var salary = ""
    @Published  var jobType = "FullTime"
    @Published  var selectedMinEducation = "Bachelors"
    @Published  var positions = ""
    @Published  var selectedExperience = "No Experience"
    @Published  var industry = "Business"
    
    
    @Published var filename = ""
    @Published var imageExt = ""
    @Published  var image: UIImage?
    @Published  var isImagePicker:Bool = false
    @Published  var isSuccefullyFetch = false
    
    @Published var isSuccesfulyUpload = false
    
    func addNewPost() {
    
        guard let imageData = image?.pngData() else {
            print("Unable to convert into data")
            return
            
        }
        self.uploadImage(imageData, filename: filename) { result in
            switch result {
            case .success(let imageUrl):
                
                print(imageUrl)
                
                let newPostData = PostData(title: self.title, description: self.description, email: self.email, address: self.address, company: self.company, industry: [self.industry], jobType: self.jobType, minEducation: self.selectedMinEducation, positions: Int(self.positions) ?? 0, experience: self.selectedExperience, salary: self.salary, companyImage: imageUrl)
                
                print(newPostData)
                
                self.UplaodNewPost(newPostData) { result in
                    switch result {
                    case .success(let isSucces):
                        self.isSuccesfulyUpload =  isSucces
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    func UplaodNewPost(_ data: PostData , completion: @escaping (Result<Bool,AuthenticationError>) -> Void) {
        
        let defaults = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        
        guard let url = URL(string: "http://localhost:3000/api/v1/job/new") else {
                   completion(.failure(.custom(errorMessage: "URL is not correct")))
                   return
               }
        
        var request = URLRequest(url: url ,timeoutInterval: Double.infinity)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")


        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(data)
        
        
        let task  = URLSession.shared.dataTask(with: request) { data, response, error in
           
            guard let data = data else {
                completion(.failure(.custom(errorMessage: "Data Not Found")))
               return
            }
            
            let decodedData = try? JSONDecoder().decode(UploadPostResponse.self, from: data)
            
            if let decodedData = decodedData {
                DispatchQueue.main.async {
                    completion(.success(decodedData.success))
                }
            }
        }
        task.resume()
        
        
    }
    
    func uploadImage(_ file: Data,filename  : String, handler : @escaping (Result<String,Error>) -> Void) {
        
        var ext: String = ""
        
        if imageExt == "png" {
            ext = "image/png"
        }else if imageExt == "jpeg"  {
            ext = "image/jpeg"
        }else if imageExt == "jpg" {
            ext = "image/jpg"
        }
        
        let defaults = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
          let headers: HTTPHeaders = [
              "Content-type": "multipart/form-data",
              "Authorization" : "Bearer \(token)"
          ]
       
   
        
        let url  = URL(string: "http://localhost:3000/api/v1/job/image/new")!

        
          AF.upload(
              multipartFormData: { multipartFormData in
                  multipartFormData.append(file, withName: "file" , fileName: filename,mimeType: ext)
          },
              to: url, method: .post , headers: headers)
              .response { response in
                  if let data = response.data {
                      let decodedData = try? JSONDecoder().decode(UploadCompanyImageResponse.self, from: data)
                      
                      DispatchQueue.main.async {
                          if  let decodedData = decodedData {
                              handler(.success(decodedData.imageUrl))
                          }
                      }
                  }
          }
      }
}
