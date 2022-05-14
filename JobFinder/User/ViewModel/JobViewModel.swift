//
//  JobViewModel.swift
//  JobViewModel
//
//  Created by Madhav Raj Verma on 14/01/22.
//

import Foundation
import Alamofire


struct ResumeUploadResponse : Decodable {
    let success :Bool
    let message:String
    let data:String
}


struct JobAppliedResponse:Decodable {
    let success :Bool
    let message:String
}

struct ApplyJobData: Codable {
    let email:String
    var resumeUrl:String
    var userImage:String = ""
    let message:String
    let country:String
}



class JobViewModel:ObservableObject {
    
    @Published  var Popularjobs :[Job] = []
    
    @Published var recentJobs:[Job] = []
    
    @Published var allJobs :[Job] = []

    
    

    func getJobs() {
        
        self.Popularjobs = []
        self.recentJobs = []

        let semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "http://localhost:3000/api/v1/jobs")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            let jobsResults =  try? JSONDecoder().decode(JobResult.self, from: data)
            DispatchQueue.main.async {
                
                self.Popularjobs = jobsResults?.data ?? []
            }
    
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
    
    func getAllJobs() {

        let semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "http://localhost:3000/api/v1/jobs")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            print(data)
            let jobsResults =  try? JSONDecoder().decode(JobResult.self, from: data)
            DispatchQueue.main.async {
                if let jobsResult = jobsResults {
                    self.allJobs = jobsResult.data
                }
            }
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
    
    
    func ApplyForJob(_ file: Data,jobID:String,filename : String,applyData:ApplyJobData , completion : @escaping (Result<Bool,Error>) ->Void ) {
        
       let baseURL = "http://localhost:3000"
        uploadResume(file, filename: filename) { result in
            
            switch result {
                
            case .success(var resumeUrl):
                
                resumeUrl.remove(at: resumeUrl.startIndex)
                let resumeNewUrl = "\(baseURL)\(resumeUrl)"
                print(resumeNewUrl)
                
                let applyData = ApplyJobData(email: applyData.email, resumeUrl: resumeNewUrl, message: applyData.message, country: applyData.country)
                
                print("Hello")
                
                self.applyJob(applyData: applyData, jobID: jobID) { result in
                    
                    switch result {
                    case .success(let success):
                        completion(.success(success))
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
    }
    
    
    func applyJob(applyData : ApplyJobData,jobID:String,completion:  @escaping (Result<Bool,Error>) -> Void) {
        let defaults = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        let url  = URL(string: "http://localhost:3000/api/v1/job/\(jobID)/apply")!

        
        var request = URLRequest(url: url ,timeoutInterval: Double.infinity)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")


        request.httpMethod = "PUT"
        request.httpBody = try? JSONEncoder().encode(applyData)
        
        
        let task  = URLSession.shared.dataTask(with: request) { data, response, error in
           
            guard let data = data else {
                completion(.failure("job Applied Unscuuceful" as! Error))
               return
            }
            
            let decodedData = try? JSONDecoder().decode(JobAppliedResponse.self, from: data)
            
            if decodedData != nil {
                DispatchQueue.main.async {
                    completion(.success(true))
                }
            }
        }
        task.resume()
       
       
    }
    
    
    
    func uploadResume(_ file: Data,filename : String, handler : @escaping (Result<String,AuthenticationError>) -> Void) {
        
        let defaults = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
          let headers: HTTPHeaders = [
              "Content-type": "multipart/form-data",
              "Authorization" : "Bearer \(token)"
          ]
       
       
        
        let url  = URL(string: "http://localhost:3000/api/v1/job/resume/apply")!

          AF.upload(
              multipartFormData: { multipartFormData in
                  multipartFormData.append(file, withName: "file" , fileName: filename, mimeType: "application/pdf")
                  
          },
              to: url, method: .post , headers: headers)
              .response { response in
                  if let data = response.data {
                      let decodedData = try? JSONDecoder().decode(ResumeUploadResponse.self, from: data)
                      DispatchQueue.main.async {
                          if  let decodedData = decodedData {
                              handler(.success(decodedData.data))
                              print(decodedData.data)
                          }
                      }
                  }

          }
      }

}
