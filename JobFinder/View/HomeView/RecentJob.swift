//
//  RecentJob.swift
//  RecentJob
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI

struct RecentJob: View {
    var body: some View {
        VStack {
            HStack {
                Image("facebook")
                    .resizable()
                    .scaledToFit()
                    .frame(width:50,height: 50)
                    .cornerRadius(8)
                
                VStack(alignment:.leading,spacing: 15) {
                    
                    Text("Facebook")
                        .font(.body)
                        .foregroundColor(.gray)
                    Text("UI/UX Designer")
                        .font(.title3)
                        .foregroundColor(.black)
                       
                    
                    Text("Full Time")
                        .font(.body)
                        .foregroundColor(.gray)
                        .fontWeight(.regular)
                }
                .padding(.leading,8)
                
                Spacer(minLength: 0)
                
                Text("$4550/m")
                    .font(.body)
                    .foregroundColor(.gray)
                    .fontWeight(.regular)
            }
        }.padding()
            .background(Color.white.cornerRadius(12).shadow(color: Color("bgColor").opacity(0.8), radius: 5, x: 3, y: 10))
    }
}

struct RecentJob_Previews: PreviewProvider {
    static var previews: some View {
        RecentJob()
    }
}
