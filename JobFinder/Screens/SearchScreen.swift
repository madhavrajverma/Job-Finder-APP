//
//  SearchScreen.swift
//  SearchScreen
//
//  Created by Madhav Raj Verma on 05/01/22.
//

import SwiftUI

struct SearchScreen: View {
    @State private var searchText :String =  ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.bottom,30)
                ScrollView(.vertical,showsIndicators: false) {
                    ForEach(0..<4) { _ in
                        NavigationLink(destination: ApplyView()) {
                            SearchResultView()
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

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
