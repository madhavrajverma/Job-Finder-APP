//
//  SearchView.swift
//  SearchView
//
//  Created by Madhav Raj Verma on 05/01/22.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText :String =  ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                ScrollView(.vertical,showsIndicators: false) {
                    ForEach(0..<4) { _ in
                        NavigationLink(destination: ApplyView()) {
                            SearchResultView()
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
