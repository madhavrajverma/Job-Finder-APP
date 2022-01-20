//
//  SearchBar.swift
//  SearchBar
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    @State private var isEditing = false
    
    let searchVm:SearchViewModel
        
    private var searchText: Binding<String> {
        
        Binding<String>(
            get: {
                self.text.capitalized
                
            }, set: {
                self.text = $0
            }
        )
    }
    
    var body: some View {
        HStack {
            
            TextField("Search ...", text: searchText,onCommit: {
                searchVm.searchJob(searchText.wrappedValue)
            })
                .padding()
                .padding(.horizontal, 25)
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.white)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""

                    // Dismiss the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar(text: .constant(""))
//    }
//}
