//
//  JobFinderApp.swift
//  JobFinder
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI
import URLImage
import URLImageStore

@main
struct JobFinderApp: App {
    
   
    @AppStorage("OnBoard") var onBoarding :Bool = true
    
    let urlImageService = URLImageService(fileStore: URLImageFileStore(), inMemoryStore: URLImageInMemoryStore())
    
    @StateObject var notificatioNVM = NotificationViewModel()
   
    var body: some Scene {
        WindowGroup {

            if onBoarding {
                OnboardView()
            }else {
                LogInView()
                    .environment(\.urlImageService, urlImageService)
                    .environmentObject(notificatioNVM)
                   
            }
              
                
        }
    }
}
