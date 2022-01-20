//
//  JobViewModel.swift
//  JobViewModel
//
//  Created by Madhav Raj Verma on 14/01/22.
//

import Foundation
import Alamofire


struct Response : Decodable {
    let success :Bool
    let message:String
    let data:String
}


class JobViewModel:ObservableObject {
    
    @Published  var Popularjobs :[Job] = []
    
    @Published var recentJobs:[Job] = []
    
    @Published var allJobs :[Job] = []
    
    @Published var resumeResponse = false
    
    init() {
        getJobs()
    }
    
    func getJobs() {

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
                    var  i = 0
                    while(i<3) {
                        self.Popularjobs.append(jobsResult.data[i])
                        i += 1
                    }
                    
                    while(i<jobsResults?.results ?? 1) {
                        self.recentJobs.append(jobsResult.data[i])
                        i += 1;
                    }
                    
                }
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
    
    
    func uploadResume(_ file: Data,jobID:String,filename : String, handler : @escaping (String) -> Void) {
        
        let defaults = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
          let headers: HTTPHeaders = [
              "Content-type": "multipart/form-data",
              "Authorization" : "Bearer \(token)"
          ]
       
       
        
        let url  = URL(string: "http://localhost:3000/api/v1/job/\(jobID)/apply")!

          AF.upload(
              multipartFormData: { multipartFormData in
                  multipartFormData.append(file, withName: "file" , fileName: filename, mimeType: "application/pdf")
          },
              to: url, method: .put , headers: headers)
              .response { response in
                  if let data = response.data {
                      let decodedData = try? JSONDecoder().decode(Response.self, from: data)
                      DispatchQueue.main.async {
                          if  let decodedData = decodedData {
                              self.resumeResponse = decodedData.success
                          }
                      }
                  }

          }
      }

}
