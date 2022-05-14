//
//  NotificationViewModel.swift
//  JobFinder
//
//  Created by Lakshya  Verma on 06/05/22.
//

import Foundation


struct NotificationResponse:Codable {
    let succces:Bool
    let notifications: [NotificationModel]
}

struct NotificationPostResponse:Codable {
    let succces:Bool
}

struct NotificationModel: Codable  {
    let _id:String
    let id:String
    let notification:String
    let job:String
    let date:String
}

struct PostNotificationModel:Codable {
    let id:String
    let notification:String
    let job:String
}


class NotificationViewModel :ObservableObject {
    
    @Published var notifications:[NotificationModel] = []
    
    
    func getAllNotification() {
        
        let defaults = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        guard let url = URL(string: "http://localhost:3000/api/v1/notification") else {
            return
        }
        
        var request = URLRequest(url: url,timeoutInterval: .infinity)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
             
            guard let data = data else {
                return
            }
            
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let decodedNotification = try? decoder.decode(NotificationResponse.self, from: data)
           
            
            guard let allNotifications = decodedNotification?.notifications else {
                return
            }
             
            let sortedNotifications = allNotifications.sorted {
                $0.date > $1.date
            }
            
            DispatchQueue.main.async {
                self.notifications = sortedNotifications
            }
            
        }
        
        task.resume()
        
    }
    
    func PostNotification(notificationData : PostNotificationModel, completion: @escaping (Result<Bool,Error>) -> Void) {
        
        let defaults = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        guard let url = URL(string: "http://localhost:3000/api/v1/notification") else {
            return
        }
        
      
        
        var request = URLRequest(url: url,timeoutInterval: .infinity)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(notificationData)
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            
            
            
            guard let data = data else {
            
                return
            }
            
            let decodedData = try? JSONDecoder().decode(NotificationPostResponse.self, from: data)
            
            guard let success = decodedData?.succces else {
                return
            }
            completion(.success(success))
            
        }
        
        task.resume()
        
    }
}
