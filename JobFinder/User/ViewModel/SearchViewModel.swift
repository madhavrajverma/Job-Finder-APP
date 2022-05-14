//
//  SearchViewModel.swift
//  SearchViewModel
//
//  Created by Madhav Raj Verma on 20/01/22.
//

import Foundation


class SearchViewModel :ObservableObject {
    
    @Published var jobs : [Job] = []
    
     
    func searchJob(_ text:String) {
        
        let url = URL(string: "http://localhost:3000/api/v1/jobs?keyword=\(text)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
              return
            }
              print(data)
              let jobsResults =  try? JSONDecoder().decode(JobResult.self, from: data)
              DispatchQueue.main.async {
                  if let jobsResult = jobsResults {
                      self.jobs = jobsResult.data
                  }
              }
            
        }.resume()
        
    }
}
