//
//  CompanyViewTab.swift
//  JobFinder
//
//  Created by Lakshya  Verma on 02/05/22.
//

import SwiftUI

struct CompanyViewTab: View {
    
    @State var tabSelection: Tabs = .home
    @StateObject var FetchPostVM = FetchPostViewModel()
    
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeCom()
                .environmentObject(FetchPostVM)
                .tabItem {
                VStack{
                    Image(systemName: "house")
                    Text("Home")
                }
            }.tag(Tabs.home)
               
            
            ChatCom()
                .tabItem {
                    VStack{
                        Image(systemName: "message")
                        Text("Chat")
                    }
                }.tag(Tabs.chat)
            
            ProfileCom()
                .tabItem {
                    VStack{
                        Image(systemName: "person")
                        Text("Profile")
                    }
                }.tag(Tabs.profile)
            
        }.accentColor(Color("fgColor"))
    }
}

struct CompanyViewTab_Previews: PreviewProvider {
    static var previews: some View {
        CompanyViewTab()
    }
}
