//
//  PopularJobView.swift
//  PopularJobView
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI
import URLImage

struct PopularJobView: View {
    
    let job:Job
    var body: some View {
        VStack {
            VStack(alignment:.leading) {
                HStack(alignment:.top) {
                    VStack {
                        if let url = URL(string: job.companyImage)  {
                            URLImage(url){ image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:35,height: 35)
                            }
                        }
                        
                        Text(job.company)
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer(minLength: 0)
                    Button(action:{
                        
                    }) {
                        Image(systemName: "heart.fill")
                            .font(.title3)
                            .foregroundColor(.red)
                    }
                }
                
                
                VStack(alignment:.leading) {
                    Text(job.title)
                        .font(.title3)
                        .foregroundColor(.black)
                      
                        .padding(.vertical)
                       
                      
                    
                    HStack {
                        Text("$\(job.salary)")
                            .foregroundColor(.black)
                        
                        Text(job.location.city)
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

//struct PopularJobView_Previews: PreviewProvider {
//    static var previews: some View {
//        PopularJobView()
//    }
//}
