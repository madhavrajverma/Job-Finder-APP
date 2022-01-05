//
//  ChooseAccountView.swift
//  ChooseAccountView
//
//  Created by Madhav Raj Verma on 29/12/21.
//

import SwiftUI

struct ChooseAccountView: View {
    var body: some View {
       
        GeometryReader {geo in
            VStack {
                
             
                Spacer()
                Text("Choose Account Type")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                
                HStack {
                    Spacer()
                    Button(action :{}){
                        SingleUserLogInTypeView(imageName: "company", type: "Company",geo: geo,color: Color("fgColor"),fontColor:.black)
                    }
                    Spacer()
                    Button(action:{}) {
                        SingleUserLogInTypeView(imageName: "man", type: "User",geo: geo,color: Color.white,fontColor:Color("fgColor"))
                    }
                    Spacer()
                
            }
                Spacer()
        }
        }.background(Color("Color").edgesIgnoringSafeArea(.all))
}
    
}

struct ChooseAccountView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseAccountView()
    }
}




struct SingleUserLogInTypeView : View {
    let imageName:String
    let type :String
    let geo:GeometryProxy
    let color:Color
    let fontColor:Color
    var body :some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width:geo.size.width * 0.32,height: 180)
            
             Text(type)
                .font(.title)
                .foregroundColor(fontColor)
        }.padding()
            .background(color.cornerRadius(8).shadow(color: Color("Color"), radius: 5, x: 4, y: 4))
    }
}
