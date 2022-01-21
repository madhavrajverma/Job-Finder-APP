//
//  HomeScreen.swift
//  HomeScreen
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI

// Main screen after succesfully enter in app

struct HomeScreen: View {
    @State private var searchText:String = ""
    @State private var isDisplayAllJobs:Bool = false
    @Binding var  selectionTab : Tabs
    
    @EnvironmentObject var jobVM :JobViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical,showsIndicators: false) {
                
            
                VStack(alignment:.leading) {
                    HStack {
                        Image("JO")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width:60,height: 60)
                            .cornerRadius(10)
                            .padding(5)
                           
                        
                        HStack {
                            
                        Spacer()
                            Button(action :{
                                selectionTab = .profile
                            }){
                                HStack {
                                    Image("mike")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.white)
                                        .frame(width:60,height: 60)
                                        .cornerRadius(10)
                                        .padding(5)
                                        .shadow(color: Color("Mlight"), radius: 5, x: 4, y: 4)
                    
                                }
                                .padding(.horizontal)

                            }
                            
                           
                            Button(action:{
                                
                            }) {
                                Image(systemName: "bell.fill")
                                    .foregroundColor(.white)
                                    .frame(width:50,height: 50)
                                    .cornerRadius(10)
                                    .padding(5)
                                    .background(Color("fgColor").cornerRadius(8).shadow(color: Color("Mlight"), radius: 5, x: 4, y: 4))
                                
                                    
                            }
                        }
                        
                    }
                    .padding(.bottom)
                        
                    VStack(alignment:.leading) {
                            Text("Find Your ")
                                .font(.title)
                                .foregroundColor(Color.gray)
                            
                            HStack {
                                Text("Dream")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                
                                Text("JOB")
                                    .font(.system(size: 45))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("fgColor"))
                                
                                
                            }
                        }
                        
                        HomeSectionTitle(title: "Popular Job") {
                            
                        }
                        .padding(.top,20)
                        
                        // MARK: - Display a popular Jobs
                        
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack(spacing:15){
                                ForEach(jobVM.Popularjobs,id:\._id) { job in
                                    NavigationLink(destination: ApplyView(selectionTab: $selectionTab,job: job)) {
                                        PopularJobView(job:job)
                                            .padding(.vertical)
                                    }
                                        
                                        
                                       
                                }
                            }
                        }
                        
    
                        //MARK: - Display recent jobs or jobs which mathced you
                        
                        HomeSectionTitle(title: "Recent Job") {
                            isDisplayAllJobs = true
                        }
                        .padding(.top,20)
                    
                            VStack(spacing:15){
                                ForEach(jobVM.recentJobs,id:\._id) { job in
                                    NavigationLink(destination:  ApplyView(selectionTab: $selectionTab,job: job)) {
                                        RecentJob(job: job)
                                    }
                                       
                                }
                            }
                        
                        
                        
                        
                    }.padding()
                
                NavigationLink("",isActive: $isDisplayAllJobs) {
                    DisplayAllJobsView(selectionTab:$selectionTab,jobsVm: jobVM)
                        .padding()
                }
                
            }
            .background(Color("Color").edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
        }
        
    }
}


//struct HomeScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeScreen(selectionTab: Tabs.home)
//    }
//}



// MARK: -  Home  section Title view

struct HomeSectionTitle: View {
    
    let title:String
    let action: () -> Void
    var body:some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            Spacer(minLength: 0)
            Button(action: {
                action()
            }) {
                Text("View More")
                    .font(.body)
                    .foregroundColor(Color("fgColor"))
                    
            }
        }
        
    }
}
