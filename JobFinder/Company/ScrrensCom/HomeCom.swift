//
//  HomeCom.swift
//  JobFinder
//
//  Created by Lakshya  Verma on 02/05/22.
//

import SwiftUI
import URLImage

struct HomeCom: View {
    @State private  var isNewPost = false
    
    @EnvironmentObject var FetchPostVM: FetchPostViewModel
    
    @State private var isNotification = false
    let gridItems =  [
    
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    
    var body: some View {
        NavigationView {
            
            ZStack(alignment: .bottomTrailing) {
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
                                    
                                }){
                                    HStack {
                                        
                                            Image("man")
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
                                    isNotification = true
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
                                Text("Post New ")
                                    .font(.title)
                                    .foregroundColor(Color.gray)
                                
                                    
                                    Text("JOB")
                                        .font(.system(size: 45))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("fgColor"))

                                }
                            }
                           
                    HStack {
                        
                        Text("Posted Jobs")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                           
                    } .padding(.vertical)
                  
                    
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ForEach(FetchPostVM.allPostedJobs,id:\._id) { job in
                            NavigationLink(destination: AppliedUsersView(jobTitle: job.title,applicationsData: job.applicantsApplied ?? [])) {
                                SingleJobPost(job: job)
                            }
                        }
                    }
                    
                  }.padding()
                Button(action:{
                    isNewPost = true
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                     
                        .frame(width: 32, height: 32)
                        .padding()
                        .background(Color("fgColor"))
                    
                }.background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .padding()
                
                
                NavigationLink(destination: NotificationView(), isActive: $isNotification) {
                    
                }
                
            }
                .fullScreenCover(isPresented: $isNewPost, content: {
                    CreateNewJobPostView()
                })
                .navigationBarHidden(true)
                .background(Color("Color").edgesIgnoringSafeArea(.all))
            
          
            
        }.onAppear {
            FetchPostVM.getPublishedJobs()
            
        }
           
           
    }
    }


struct HomeCom_Previews: PreviewProvider {
    static var previews: some View {
        HomeCom()
    }
}



