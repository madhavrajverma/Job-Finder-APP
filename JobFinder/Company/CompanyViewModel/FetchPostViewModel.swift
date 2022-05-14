//
//  FetchPostViewModel.swift
//  JobFinder
//
//  Created by Lakshya  Verma on 04/05/22.
//

import Foundation


class FetchPostViewModel :ObservableObject {
    
    @Published var allPostedJobs: [Job] = []
    @Published var resumeData :Data?
    
    func getPublishedJobs() {
        
        print("Inside")
        
        let defaults  = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/v1/jobs/published")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            
            let publishedJobsResults =  try? JSONDecoder().decode(JobResult.self, from: data)
            
            guard let publishedResult = publishedJobsResults?.data else {
                return
            }
            DispatchQueue.main.async {
                self.allPostedJobs = publishedResult
            }
            
          
        }

        task.resume()
    }
    
    func downloadResume(url:String,completion:@escaping (Result<Data,Error>) -> Void) {
        
        print(url)
        
        guard let newUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        print(newUrl)
        
        guard let url = URL(string: newUrl) else  {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            print("hii")
            
            guard let data = data else {
                return
            }
            
            print(data)
            DispatchQueue.main.async {
                completion(.success(data))
            }
            
            
        }.resume()
    }
    
    
}
