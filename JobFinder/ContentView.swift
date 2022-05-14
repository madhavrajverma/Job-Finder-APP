//
//  ContentView.swift
//  JobFinder
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI

enum Tabs{
    case home, profile,chat,search
}


struct ContentView: View {
    @StateObject var jobVM :JobViewModel = JobViewModel()
    @StateObject var userVM:UserViewModel = UserViewModel()
    @State var tabSelection: Tabs = .home
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeScreen(selectionTab: $tabSelection)
                .environmentObject(userVM)
                .environmentObject(jobVM).tabItem {
                VStack{
                    Image(systemName: "house")
                    Text("Home")
                }
            }.tag(Tabs.home)
                .animation(.easeIn)
            
            SearchScreen(selectionTab: $tabSelection)
                .environmentObject(jobVM)
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }.tag(Tabs.search)
            
            ChatScreen()
                .tabItem {
                    VStack{
                        Image(systemName: "message")
                        Text("Chat")
                    }
                }.tag(Tabs.chat)
            
            ProfileScreen().environmentObject(userVM)
                .tabItem {
                    VStack{
                        Image(systemName: "person")
                        Text("Profile")
                    }
                }.tag(Tabs.profile)
            
        }.accentColor(Color("fgColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
