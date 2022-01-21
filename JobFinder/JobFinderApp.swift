//
//  JobFinderApp.swift
//  JobFinder
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI

@main
struct JobFinderApp: App {
    @StateObject var jobVM :JobViewModel = JobViewModel()
   
    var body: some Scene {
        WindowGroup {
//            LogInView()
            LogInView()
                .environmentObject(jobVM)
              
                
        }
    }
}
