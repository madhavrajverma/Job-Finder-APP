//
//  SearchScreen.swift
//  SearchScreen
//
//  Created by Madhav Raj Verma on 05/01/22.
//

import SwiftUI

struct SearchScreen: View {
    @State private var searchText :String =  ""
    @StateObject var seacrhVM :SearchViewModel = SearchViewModel()
    @Binding var  selectionTab : Tabs
    var body: some View {
        NavigationView {
            VStack {
                
                SearchBar(text: $searchText,searchVm:seacrhVM )
                    .padding(.bottom,30)
                  
                    
                
                if seacrhVM.jobs.count > 0 {
                    ScrollView(.vertical,showsIndicators: false) {
                        ForEach(seacrhVM.jobs,id:\._id) { job in
                            NavigationLink(destination: ApplyView(selectionTab: $selectionTab, job: job)) {
                                SearchResultView(job: job)
                            }
                        }
                    }
                }else {
                   
                    Image("searchEmpty")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth:.infinity)
                        .padding(.top,40)
                    
                    Spacer()
                }
            }
            .onAppear(perform: {
                seacrhVM.jobs = []
                
            })
            .background(Color("Color").edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}



