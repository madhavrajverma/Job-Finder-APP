//
//  AppliedUsersView.swift
//  JobFinder
//
//  Created by Lakshya  Verma on 03/05/22.
//

import SwiftUI

struct AppliedUsersView: View {
    let jobTitle: String
    let applicationsData:[Applications]
    
    var body: some View {
        
        
        if applicationsData.isEmpty {
            EmptyView()
                .navigationTitle( Text("Applied User"))
        }else {
            
                 ScrollView(.vertical,showsIndicators: false) {
                     HStack {
                        
                         Spacer()
                     }
                     
                     VStack {
                         ForEach(applicationsData,id:\.id) { applicationData in
                             NavigationLink(destination: AppliedUserDetailView(jobTitle: jobTitle, applicationsData: applicationData)) {
                                 AppliedUser(data:applicationData, jobTitle: jobTitle)
                             }
                         }
                     }
                 }.padding()
                 .onAppear(perform: {
                 })
                 .navigationTitle( Text("Applied User"))
        }
    }
}


