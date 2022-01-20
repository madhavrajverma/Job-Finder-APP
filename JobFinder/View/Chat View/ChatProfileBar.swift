//
//  ChatProfileBar.swift
//  ChatProfileBar
//
//  Created by Madhav Raj Verma on 05/01/22.
//



import SwiftUI

struct ChatProfileBar :View {
    
    @Environment(\.presentationMode)  var presentationMode: Binding<PresentationMode>
    
    var backbtn : some View {
        Button(action :{ presentationMode.wrappedValue.dismiss()}) {
            Image(systemName: "chevron.left")
                .font(.body)
                .foregroundColor(.white)
                .padding()
                .background(Color("fgColor").cornerRadius(8).shadow(color: Color("Mlight"), radius: 5, x: 4, y: 4))
        }
        
    }

    
    var body: some View {
        VStack{
            HStack  {
                backbtn
                    .padding(.leading)
                Spacer()
                Image("mike")
                    .resizable()
                    .frame(minWidth: 50, maxWidth: 50, minHeight: 50
                           , maxHeight: 50 )
                    .clipped()
                
                VStack(alignment:.leading) {
                    Text("Madhav")
                        .font(.headline)
                        
                Text("Online")
                        .font(.caption)
                        .fontWeight(.light)
                }
                Spacer()
                
                Button(action:{
                    
                }) {
                    Image(systemName: "phone.fill")
                        .padding(8)
                        .background(Color("fgColor").cornerRadius(8).shadow(color: Color("Mlight"), radius: 5, x: 4, y: 4))
                }.padding(.trailing)
                
                
                
            }.foregroundColor(.black)
            .padding([.trailing,.bottom,.top])
        }.padding(.top,30)
        
        .frame(maxWidth:.infinity)
//            .padding()
            .background(Color.white.cornerRadius(10).shadow(color: Color("Color").opacity(0.3), radius: 15, x: 6, y: 6)
                            .shadow(color: Color("Color").opacity(0.3), radius: 15, x: -6, y: -6))
    }
}


struct ChatProfileBar_Previews: PreviewProvider {
    static var previews: some View {
        ChatProfileBar()
    }
}


