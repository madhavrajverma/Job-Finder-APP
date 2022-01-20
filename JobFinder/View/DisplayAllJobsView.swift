//
//  DisplayAllJobsView.swift
//  DisplayAllJobsView
//
//  Created by Madhav Raj Verma on 05/01/22.
//

import SwiftUI

struct DisplayAllJobsView: View {
    @Environment(\.presentationMode) var presenationMode
    @Binding var selectionTab : Tabs
    @ObservedObject var jobsVm :JobViewModel
    
    var body: some View {
            VStack {
                
                HStack() {
                    Button(action:{
                        presenationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.body)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("fgColor").cornerRadius(8).shadow(color: Color("Mlight"), radius: 5, x: 4, y: 4))
                    }
                    
                   
                  
                    Text("Home")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.leading)
                    Spacer(minLength: 0)
                    
                }
               
                ScrollView(.vertical,showsIndicators: false) {
                    
                    
                    
                    
                    ForEach(jobsVm.allJobs,id:\._id) { job in
                        NavigationLink(destination: ApplyView(selectionTab: $selectionTab,job: job)) {
                            RecentJob(job: job)
                        }
                    }
                }
            
            .navigationBarBackButtonHidden(true)
            
            .navigationBarHidden(true)
           
            }.onAppear {
                jobsVm.getAllJobs()
            }
    }
}

//struct DisplayAllJobsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DisplayAllJobsView()
//    }
//}
