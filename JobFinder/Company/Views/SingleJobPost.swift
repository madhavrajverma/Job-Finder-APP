//
//  SingleJobPost.swift
//  JobFinder
//
//  Created by Lakshya  Verma on 04/05/22.
//

import Foundation
import SwiftUI
import URLImage


struct SingleJobPost : View {
   
    let job:Job
    
    var body: some View {
        VStack(alignment:.center) {
            VStack(alignment:.leading) {
                HStack(alignment:.top) {
                    Spacer(minLength: 0)
                    VStack {
                        if let url = URL(string: job.companyImage)  {
                            URLImage(url){ image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                                    .frame(width:45,height: 45)
                                   
                            }
                        }
                        
                        Text(job.company)
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    Spacer(minLength: 0)
                    
                }
                
                
                VStack(alignment:.leading) {
                    Text(job.title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("buttonColor"))
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                      
                        .padding(.vertical)
                       
                    
                    HStack {
                        Text("$\(job.salary)")
                            .foregroundColor(.black)
                        
                       
                    }
                    
                    HStack {
                        
                        Text(job.location.city)
                            .foregroundColor(.gray)
                    }

                }
                
                
            }
        }
        .padding(.trailing)
        .padding()
        .background(Color.white.cornerRadius(12).shadow(color: Color("bgColor").opacity(0.6), radius: 10, x: 3, y: 10))
    
    }
}
