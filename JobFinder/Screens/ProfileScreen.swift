//
//  ProfileScreen.swift
//  ProfileScreen
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI

struct ProfileScreen: View {
    @State private var isEditProfileView:Bool = false
    @State private var isAplicationView:Bool = false
    @State private var isNotificationView:Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                   
                    VStack {
                        Text("Profile")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                        Image("mypic")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .shadow(radius: 2)
                            .frame(width:200,height: 200)
                          
                        Text("Madhav raj verma")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text(verbatim: "Mad007@gamil.com")
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    
                  
                    
                    VStack(alignment:.leading,spacing: 25) {
                        editProfileBtn
                        applicationBtn
                        notificationBtn
                        shareAppBtn
                    }
                    .padding(.vertical)
                    Spacer(minLength: 0)
                    
                    NavigationLink("",isActive: $isEditProfileView) {
                        EditProfile()
                    }
                    
                    NavigationLink("",isActive: $isAplicationView) {
                        MyApplicationView()
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
    
    
    // Application button
    
    var applicationBtn:some View {
        Button(action:{
            isAplicationView = true
        }) {
            ProfileMenuItemView(text: "My Application", color: Color.yellow, icon: "clock.fill")
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

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}


struct ProfileMenuItemView: View {
    let text:String
    let color:Color
    let icon:String
    
    var body:some View {
        VStack(alignment:.leading) {
            HStack {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(8)
                    .background(color.cornerRadius(10))
                Text(text)
                    .font(.title3)
                    .foregroundColor(.black.opacity(0.7))
                Spacer()
            }
           
        }.padding(.horizontal)
    }

}



