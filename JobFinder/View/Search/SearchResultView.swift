//
//  SearchResultView.swift
//  SearchResultView
//
//  Created by Madhav Raj Verma on 05/01/22.
//

import SwiftUI
import URLImage

struct SearchResultView: View {
    let job:Job
    var body: some View {
        VStack {
            HStack {
                
                if let url = URL(string: job.companyImage)  {
                    URLImage(url){ image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width:50,height: 50)
                            .cornerRadius(8)
                        
                    }
                }
                  
                VStack(alignment:.leading,spacing: 15) {
                    
                    Text(job.company)
                        .font(.body)
                        .foregroundColor(.gray)
                    Text(job.title)
                        .font(.title3)
                        .foregroundColor(.black)
                       
                    
                    Text(job.jobType)
                        .font(.body)
                        .foregroundColor(.gray)
                        .fontWeight(.regular)
                }
                .padding(.leading,8)
                
                Spacer(minLength: 0)
                
                Text("$\(job.salary)")
                    .font(.body)
                    .foregroundColor(.gray)
                    .fontWeight(.regular)
            }
        }.padding()
            .background(Color.white.cornerRadius(12).shadow(color: Color("bgColor").opacity(0.8), radius: 5, x: 3, y: 10))
    }
}



//struct SearchResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultView()
//    }
//}
