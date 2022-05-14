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
        .padding()
        .background(Color.white.cornerRadius(12).shadow(color: Color("bgColor").opacity(0.6), radius: 10, x: 3, y: 10))
       
       
    }
}

//struct PopularJobView_Previews: PreviewProvider {
//    static var previews: some View {
//        PopularJobView()
//    }
//}


struct SingleJobPostView :View {
    var body: some View {
    Text("Hello")
    
    }
}



//
//VStack {
//    VStack(alignment:.leading) {
//        HStack(alignment:.top) {
//            VStack {
//                if let url = URL(string: job.companyImage)  {
//                    URLImage(url){ image in
//                        image
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width:35,height: 35)
//                    }
//                }
//                
//                Text(job.company)
//                    .font(.headline)
//                    .foregroundColor(.gray)
//            }
//            
//            Spacer(minLength: 0)
//            Button(action:{
//                
//            }) {
//                Image(systemName: "heart.fill")
//                    .font(.title3)
//                    .foregroundColor(.red)
//            }
//        }
//        
//        
//        VStack(alignment:.leading) {
//            Text(job.title)
//                .font(.title3)
//                .foregroundColor(.black)
//              
//                .padding(.vertical)
//               
//              
//            
//            HStack {
//                Text("$\(job.salary)")
//                    .foregroundColor(.black)
//                
//                Text(job.location.city)
//                    .foregroundColor(.gray)
//            }
//        }
//        
//        
//    }
//}
//.padding(.trailing)
//.padding()
//.background(Color.white.cornerRadius(12).shadow(color: Color("bgColor").opacity(0.8), radius: 5, x: 3, y: 10))
