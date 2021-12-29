//
//  NotificationSettigView.swift
//  NotificationSettigView
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI

struct NotificationSettigView: View {
    @Environment(\.presentationMode) var presenationMode
    @State private var isNewPost :Bool = false
    @State private var isGetHired:Bool = false
    @State private var isGetRejected :Bool = false
    @State private var isMessage:Bool = false
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button(action:{
                        presenationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.body)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("fgColor").cornerRadius(8).shadow(color: Color("Mlight"), radius: 5, x: 4, y: 4))
                    }
                    Spacer(minLength: 0)
                }
                
                Text("Notification")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
            }
            
            
            VStack(spacing:20) {
                HStack{
                    Text("New Post")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.7))
                    Toggle("", isOn: $isNewPost)
                        .toggleStyle(SwitchToggleStyle(tint: Color("fgColor")))
                }
                
                HStack{
                    Text("Got Hired")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.7))
                    Toggle("", isOn: $isGetHired)
                        .toggleStyle(SwitchToggleStyle(tint: Color("fgColor")))
                }
                HStack{
                    Text("Get Rejected")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.7))
                    Toggle("", isOn: $isGetRejected)
                        .toggleStyle(SwitchToggleStyle(tint: Color("fgColor")))
                }
                HStack{
                    Text("Message")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.7))
                    Toggle("", isOn: $isMessage)
                        .toggleStyle(SwitchToggleStyle(tint: Color("fgColor")))
                }
            }
            Spacer()
        }.padding()
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
    }
}

struct NotificationSettigView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationSettigView()
    }
}
