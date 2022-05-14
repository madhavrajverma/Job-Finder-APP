//
//  AppliedUser.swift
//  JobFinder
//
//  Created by Lakshya  Verma on 02/05/22.
//

import SwiftUI
import URLImage

struct AppliedUser: View {
    let data:Applications
    let jobTitle:String
    var body: some View {
       
        ZStack(alignment:.leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemGray6))
                .frame(maxWidth:.infinity)
                .frame(height:100)
                
           

//
            HStack(alignment:.top) {
                
                
                
                if let userImage =  data.userImage , let url = URL(string: userImage)   {
                    
                    URLImage(url){ image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 60, maxWidth: 80, minHeight: 60, maxHeight: 80)
                            .cornerRadius(10)
                            .padding(.leading,10)

                    }
                } else {
                    Image("mike")
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 60, maxWidth: 80, minHeight: 60, maxHeight: 80)
                        .cornerRadius(10)
                        .padding(.leading,10)
                }
                
                VStack(alignment:.leading,spacing: 10) {
                    Text(data.name ?? "")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                    
                    Text("Email : \(data.email ?? "")")
                        .font(.body)
                        .fontWeight(.light)
                    
                   Text("Applied For:\(jobTitle)")
                        .font(.body)
                        .foregroundColor(.gray)
                        .fontWeight(.regular)
                    
                }
                
            }
          
        }
        
    }
}



//struct AppliedUser_Previews: PreviewProvider {
//    static var previews: some View {
//        AppliedUser()
//    }
//}
