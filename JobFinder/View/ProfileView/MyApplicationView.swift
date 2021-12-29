//
//  MyApplicationView.swift
//  MyApplicationView
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI

struct MyApplicationView: View {
    
    @Environment(\.presentationMode) var presenationMode
    var body: some View {
        ScrollView{
            
            VStack {
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
                    }
                    
                    Text("My Applications")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
                
                ForEach(0..<8) { _ in
                    AplliedJobView()
                }
                
                
            }.padding()
        }.background(Color("Color").edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct MyApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        MyApplicationView()
    }
}


struct AplliedJobView: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image("apple")
                        .resizable()
                        .scaledToFit()
                        .frame(width:50,height: 50)
                        .cornerRadius(8)
                    
                    VStack(alignment:.leading,spacing: 15) {
                        
                        Text("Apple")
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
                
                }
                
                HStack {
                    Spacer()
                    Text("Deleivered")
                        .font(.body)
                        .foregroundColor(Color.blue.opacity(0.6))
                    Spacer()
                    Text("$4550/m")
                        .foregroundColor(.white)
                        .font(.body)
                        .padding()
                        .background(Color("buttonColor").opacity(0.4).cornerRadius(10))
                    Spacer()
                }
            }
        }.padding()
            .background(Color.white.cornerRadius(12).shadow(color: Color("bgColor").opacity(0.8), radius: 5, x: 3, y: 10))
    }
}




