//
//  PopularJobView.swift
//  PopularJobView
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI

struct PopularJobView: View {
    var body: some View {
        VStack {
            VStack(alignment:.leading) {
                HStack(alignment:.top) {
                    VStack {
                        Image("google")
                            .resizable()
                            .scaledToFit()
                            .frame(width:35,height: 35)
                        
                        Text("Google")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer(minLength: 0)
                    Button(action:{}) {
                        Image(systemName: "heart.fill")
                            .font(.title3)
                            .foregroundColor(.red)
                    }
                }
                
                
                VStack(alignment:.leading) {
                    Text("Lead Product Manager")
                        .font(.title3)
                        .foregroundColor(.black)
                      
                        .padding(.vertical)
                       
                      
                    
                    HStack {
                        Text("$2500/m")
                            .foregroundColor(.black)
                        
                        Text("Toronoto Canada")
                            .foregroundColor(.gray)
                    }
                }
                
                
            }
        }
        .padding(.trailing)
        .padding()
        .background(Color.white.cornerRadius(12).shadow(color: Color("bgColor").opacity(0.8), radius: 5, x: 3, y: 10))
       
    }
}

struct PopularJobView_Previews: PreviewProvider {
    static var previews: some View {
        PopularJobView()
    }
}
