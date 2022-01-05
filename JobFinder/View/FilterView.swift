//
//  FilterView.swift
//  FilterView
//
//  Created by Madhav Raj Verma on 05/01/22.
//

import SwiftUI

struct FilterView: View {
    
    @State private var categorySelection :String = "Web Developer"
    @State private var categoryList : [String] = ["Ios Developer", "Web Developer"]
    
    var body: some View {
        VStack {
            Text("Set Filters ")
                .font(.title3)
                .foregroundColor(Color.black.opacity(0.6))
            
            Picker(selection: $categorySelection) {
                
                
            } label: {
                HStack {
                    Text("Select Category")
                    Text(categorySelection)
                }.font(.title)
                    .foregroundColor(.black.opacity(0.6))
                    .padding()
                    .padding(.horizontal)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 4, x: 5, y: 5)
            }

            
            
            
        }.background(Color("Color").edgesIgnoringSafeArea(.all))
            
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}



struct NewDropDownView:View {
    @State var showStoreDropDown: Bool = false
    var body: some View {
       
          //ui
         HStack(alignment: .center, spacing: 16) {
                            
                            //here you UI goes
                            
                        }.overlay (
                            
                            VStack {
                                
                                if showStoreDropDown {
                                    
                                    Spacer(minLength: 40)
                                    
                                    SampleDropDown(action: { data in
                                        
                                    })
                                    
                                }
                                
                            }, alignment: .topLeading
                            
                        ).onTapGesture {
                            
                            showStoreDropDown.toggle()
                            
                        }


    }
}


import SwiftUI


struct SampleDropDown: View {
    
  
    let action : (String?) -> Void
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 4){
            
            ForEach(0...3, id: \.self){ valueStore in
                
                Button(action: {
                    
                    
                    
                }) {
                    
                    HStack(alignment: .center, spacing: 8) {
                        
                        Image(systemName: "bell")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .clipShape(Circle())
                        
                        VStack (alignment: .leading){
                            Text("ANDROID" )
                                .font(.headline)
                                .foregroundColor(Color.blue)
                                .padding([.leading, .top], 4)
                            
                            Text("#jetpack")
                                .font(.headline)
                                .foregroundColor(Color.green)
                                .padding([.leading, .bottom], 2)
                            
                        }
                        
                        
                    }.foregroundColor(Color.gray)
                    
                }.frame(width: .none, height: .none, alignment: .center)
                
                
                Divider().background(Color.green)
                
            }
            
        }.padding(.all, 12)
        .background(RoundedRectangle(cornerRadius: 6).foregroundColor(.white).shadow(radius: 2))
        
    }
}

struct SampleDropDown_Previews: PreviewProvider {

    static var previews: some View {
        SampleDropDown(action: {data in}).padding()
    }
}

