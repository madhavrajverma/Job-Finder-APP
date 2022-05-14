//
//  OnboardView.swift
//  OnboardView
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI

struct OnboardView: View {
    
    @AppStorage("OnBoard") var onBoarding :Bool?
    var body: some View {
        GeometryReader {geo in
            VStack {
                Image("onboard")
                    .resizable()
                    .scaledToFit()
                    .frame(height: geo.size.height * 0.60);
              
                VStack{
                    
                    VStack(alignment:.center) {
                        Text("Find a Perfect")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .opacity(0.8)
                        
                        Text("Job Match")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .opacity(0.8)
                        
                    }
                    
                    Text("Finding your job is more easier and faster with JobGo")
                        .font(.body)
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .padding(.vertical,2)
                }.padding(.bottom,8)
                   
                   
                
                
                Button(action :{
                    onBoarding = false
                }) {
                    Text("Let's Get Started →")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding()
                        .padding(.horizontal)
                        .background(Color("fgColor").cornerRadius(10).shadow(color: Color("Mlight"), radius: 5, x: 4, y: 4))
                        
                }
            }.padding()
        }
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
