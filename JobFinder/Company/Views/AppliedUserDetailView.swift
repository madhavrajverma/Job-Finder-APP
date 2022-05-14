//
//  AppliedUserDetailView.swift
//  JobFinder
//
//  Created by Lakshya  Verma on 02/05/22.
//

import SwiftUI
import URLImage

struct AppliedUserDetailView: View {
    
    let jobTitle: String
    let applicationsData:Applications
    @EnvironmentObject var notificationVM: NotificationViewModel
    
    @State private var isPostNotification = false
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(spacing:20) {
                AppliedUserProfileHeader(applicationsData: applicationsData, title: jobTitle)
                    .padding(.vertical)
                VStack (spacing:26){
                    
                    HStack {
                        Text("Message")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    
                    Text(applicationsData.message ?? "No Message")
                        .font(.headline)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                }
                
                VStack {
                    HStack {
                        Text("CV")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    
                    NavigationLink(destination: CVView(applicationsData: applicationsData)) {
                            Text("Open Resume")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("fgColor"))
                                .cornerRadius(8)
                        }
                   
                    
                    acceptUser
                        .padding(.vertical)
                }
            }.padding()
                .alert(isPresented: $isPostNotification) {
                    Alert(title: Text("Accept User Successful"), message: Text("You have succefully accept this user for a job "), dismissButton: .cancel())
                }
        }
        .navigationTitle("User Details")
    }
    
    var acceptUser:some View {
        Button(action:{
            let mesagge = "Your resume have been selected for"
            let job = jobTitle
            let id = applicationsData.id ?? ""
            let postNotificationData = PostNotificationModel(id: id, notification: mesagge, job: job)
            notificationVM.PostNotification(notificationData: postNotificationData) { result in
                switch result {
                case .success(let succes):
                    self.isPostNotification = succes
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
            
        }) {
            Text("Accept  User")
                .foregroundColor(.white)
                .fontWeight(.bold)
               
                .padding()
                .frame(maxWidth:.infinity)
                .background(Color("fgColor").cornerRadius(10))
                .padding(.horizontal,20)
            
        }
    }
}

//struct AppliedUserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppliedUserDetailView()
//    }
//}


struct AppliedUserProfileHeader : View {
    
    let applicationsData:Applications
    let title:String
    
    var body: some View {
        ZStack(alignment:.leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("Mlight"))
                .frame(maxWidth:.infinity)
                .frame(height:200)
                
           
            
            HStack(alignment:.top) {
                
                
                if let userImage =  applicationsData.userImage , let url = URL(string: userImage)   {
                    
                    URLImage(url){ image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 80, maxWidth: 100, minHeight: 80, maxHeight: 100)
                            .cornerRadius(10)
                            .padding(.leading,10)

                    }
                } else {
                    Image("mike")
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 80, maxWidth: 100, minHeight: 80, maxHeight: 100)
                        .cornerRadius(10)
                        .padding(.leading,10)
                }
                
                   
                
                VStack(alignment:.leading,spacing: 10) {
                    Text(applicationsData.name ?? "No Name")
                        .font(.body)
                        .fontWeight(.regular)
                    
                    Text("Email : \(applicationsData.email ?? "")")
                    
                   Text("Applied For: \(title)")
                        .font(.body)
                        .foregroundColor(.gray)
                        .fontWeight(.regular)
                    
                }
                
            }
          
        }
    }
}
