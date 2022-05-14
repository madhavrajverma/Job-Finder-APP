//
//  ProfileCom.swift
//  JobFinder
//
//  Created by Lakshya  Verma on 02/05/22.
//

import SwiftUI

struct ProfileCom: View {
    
    
    @State private var isEditProfileView = false
    
    @State private var isNotificationView = false
    
    @EnvironmentObject private var loginVM:LoginViewModel
    
    
    var body: some View {
        NavigationView {
            ScrollView {
               
                VStack {
                   
                    VStack {
                        Text("Profile")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                        
                                   Image("mike")
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(Circle())
                                        .shadow(radius: 2)
                                        .frame(width:200,height: 200)
                        
                       
                          
                        Text("Madhav raj")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text(verbatim:  "Madhav@gmail.com")
                            .font(.body)
                            .foregroundColor(.gray)
                    }
    
                    VStack(alignment:.leading,spacing: 25) {
                        editProfileBtn

                        notificationBtn
                        shareAppBtn
                    }
                    .padding(.vertical)
                    Spacer(minLength: 0)
                    
                    NavigationLink("",isActive: $isEditProfileView) {
                        
                    }
                    
                    
            
                    
                    NavigationLink("",isActive: $isNotificationView) {
                        NotificationSettigView()
                    }
                    
                    
                    logOutBtn
                        .padding(.bottom,20)
                    
                }.padding()
                    .navigationBarHidden(true)
                 
            }
        }
    }
    
    // Edit Profile Button
    
    var editProfileBtn :some View {
        Button(action:{
            isEditProfileView = true
        }) {
            ProfileMenuItemView(text: "Edit Profile", color: Color.red, icon: "person.fill")
        }
    }
    
    
    
    

    // Notification button
    
    var notificationBtn: some View {
        Button(action:{
            isNotificationView = true
        }) {
            ProfileMenuItemView(text: "Notification Settings", color: Color.green, icon: "gear")
        }
    }
    
    
    
    // Share app button
    var shareAppBtn: some View {
        Button(action:{
            actionSheet()
        }) {
            ProfileMenuItemView(text: "Share App", color: Color.pink, icon: "heart.fill")
        }
    }
    
  // Log out Button
    var logOutBtn: some View {
        Button(action:{
            loginVM.signOut()
        }) {
            ProfileMenuItemView(text: "Log Out", color: Color.red, icon: "arrowshape.turn.up.backward.fill")
        }
    }
    
  // Share app Method or function
    
    func actionSheet() {
        
        guard let urlShare = URL(string:"http://developer.apple.com/xcode/swiftui/") else {return}
        
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

struct ProfileCom_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCom()
    }
}
