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
                ScrollView(.vertical,showsIndicators: false) {
                    ForEach(seacrhVM.jobs,id:\._id) { job in
                        NavigationLink(destination: ApplyView(selectionTab: $selectionTab, job: job)) {
                            SearchResultView(job: job)
                        }
                    }
                }
            }
            .background(Color("Color").edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}


//
//struct SearchScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchScreen()
//    }
//}
