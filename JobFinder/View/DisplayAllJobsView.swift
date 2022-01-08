//
//  DisplayAllJobsView.swift
//  DisplayAllJobsView
//
//  Created by Madhav Raj Verma on 05/01/22.
//

import SwiftUI

struct DisplayAllJobsView: View {
    @Environment(\.presentationMode) var presenationMode
    var body: some View {
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
                }.padding(.leading)
               
                ScrollView(.vertical,showsIndicators: false) {
                    ForEach(0..<4) { _ in
                        NavigationLink(destination: ApplyView()) {
                            SearchResultView()
                        }
                    }
                }
            
            .navigationBarBackButtonHidden(true)
            .background(Color("Color").edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
           
        }
    }
}

struct DisplayAllJobsView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayAllJobsView()
    }
}
