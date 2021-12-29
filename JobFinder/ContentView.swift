//
//  ContentView.swift
//  JobFinder
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeScreen().tabItem {
                VStack{
                    Image(systemName: "house")
                    Text("Home")
                }
            }
            ChatScreen()
                .tabItem {
                    VStack{
                        Image(systemName: "message")
                        Text("Chat")
                    }
                }
            
            ProfileScreen()
                .tabItem {
                    VStack{
                        Image(systemName: "person")
                        Text("Profile")
                    }
                }
            
        }.accentColor(Color("fgColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
