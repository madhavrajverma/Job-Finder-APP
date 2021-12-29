//
//  HomeScreen.swift
//  HomeScreen
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI

struct HomeScreen: View {
    @State private var searchText:String = ""
    var body: some View {
        NavigationView{
            ScrollView(.vertical,showsIndicators: false) {
                
            
                    VStack {
                        HStack {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color.gray)
                                TextField("What do you want to order", text: $searchText)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
                            
                            Button(action:{}) {
                                Image("filter")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:40,height: 40)
                                    .padding(5)
                                    .background(Color("fgColor").cornerRadius(10))
                                    
                            }
                            .padding(.horizontal)
                        
                            
                        }
                        
                        HomeSectionTitle(title: "Popular Job") {
                            
                        }
                        .padding(.top,20)
                        
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack(spacing:15){
                                ForEach(0..<6) { _ in
                                    NavigationLink(destination: ApplyView()) {
                                        PopularJobView()
                                            .padding(.vertical)
                                    }
                                        
                                        
                                       
                                }
                            }
                        }
                        
                        
                        HomeSectionTitle(title: "Recent Job") {
                            
                        }
                        .padding(.top,20)
                    
                            VStack(spacing:15){
                                ForEach(0..<6) { _ in
                                    NavigationLink(destination: ApplyView()) {
                                        RecentJob()
                                    }
                                       
                                }
                            }
                        
                        
                        
                        
                    }.padding()
                
            }
            .background(Color("Color").edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}




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
