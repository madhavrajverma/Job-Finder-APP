//
//  ApplyView.swift
//  ApplyView
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI
import URLImage

struct ApplyView: View {
    @State private var isApplyNow:Bool = false
    @Environment(\.presentationMode) var presenationMode
    @Binding var  selectionTab : Tabs
    let job:Job
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            
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
            }
            VStack {
                VStack{
                    
                    
                    if  let url = URL(string: job.companyImage)  {
                        URLImage(url) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width:120,height:120)
                                .cornerRadius(10)
                        }
                    }
                    
                    
                       
                    
                    Text(job.title)
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                
                VStack {
                    VStack(alignment:.center,spacing:10){
                        Text(job.company)
                            .font(.title2)
                        
                        HStack {
                            Image("mappin")
                                .resizable()
                                .scaledToFit()
                                .frame(width:25,height: 25)
                            Text(job.address)
                                .foregroundColor(.gray)
                                .font(.body)
                        }
                    }
                    .padding(.vertical)
                    HStack {
                        Spacer()
                        HStack {
                            Image(systemName: "clock")
                                .foregroundColor(.gray)
                            Text("Full Time")
                                .foregroundColor(.gray)
                                .font(.title3)
                        }
                        
                        Spacer()
                        Text("\(job.salary)m")
                            .foregroundColor(.white)
                            .font(.title3)
                            .padding()
                            .background(Color("buttonColor").opacity(0.4).cornerRadius(10))
                        Spacer()
                    }
                    .padding(.vertical)
                    
                    VStack(alignment:.leading,spacing: 10) {
                        Text("Description:")
                            .font(.title3)
                        
                        Text(job.description)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(1)
                        
                    }
                    .padding(.vertical)
                    HStack {
                        Text("Experience:")
                            .font(.title3)
                        Spacer()
                        Text(job.experience)
                            .foregroundColor(.white)
                            .font(.body)
                            .padding()
                            .background(Color("buttonColor").opacity(0.4).cornerRadius(10))
                    }.padding(.vertical)
                    
                }
            }
            
            HStack(spacing:5) {
                applyBtn
                messageBtn
            }
            
            NavigationLink("", isActive: $isApplyNow) {
                JobApply(job:job)
            }

        }.padding()
            .background(Color("Color").edgesIgnoringSafeArea(.all))
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
           
    }
    
    var messageBtn:some View {
        Button(action:{
            selectionTab = .chat
        }) {
            Image(systemName: "message.fill")
                .foregroundColor(.white)
                .padding()
                .background(Color("fgColor").cornerRadius(10).shadow(color: Color("Mlight"), radius: 5, x: 4, y: 4))
                .padding(.horizontal,5)
        }
    }
    
    var applyBtn: some View {
        Button(action:{
            isApplyNow = true
        }) {
            Text("Apply Now")
                .foregroundColor(.white)
                .fontWeight(.bold)
               
                .padding()
                .frame(maxWidth:.infinity)
                .background(Color("fgColor").cornerRadius(10).shadow(color: Color("Mlight"), radius: 5, x: 4, y: 4))
                .padding(.horizontal,5)
              
                
        }
    }
}

//struct ApplyView_Previews: PreviewProvider {
//    static var previews: some View {
//        ApplyView()
//    }
//}
