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
        }    }

    
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




//
//struct ChatListView: View {
//    let image:String
//    let name:String
//    let msg:String
//    var body: some View {
//        VStack{
//            HStack(alignment:.top) {
//                Image(image)
//                    .resizable()
//                    .frame(minWidth: 60, maxWidth: 80, minHeight: 80
//                           , maxHeight: 90 )
//                    .clipped()
//                    .padding(.horizontal,8)
//
//
//                VStack(alignment:.leading) {
//                    Text(name)
//                        .font(.body)
//
//                Text(msg)
//                        .font(.caption)
//                        .fontWeight(.light)
//                }
//                Spacer()
//
//                Text("20:00")
//                    .font(.caption)
//                    .fontWeight(.light)
//            }.foregroundColor(.black)
//            .padding([.trailing,.bottom,.top])
//        }.frame(maxWidth:.infinity)
////            .padding()
//            .background(Color.white.cornerRadius(10).shadow(color: Color.shadowColor.opacity(0.3), radius: 15, x: 6, y: 6)
//                            .shadow(color: Color.shadowColor.opacity(0.3), radius: 15, x: -6, y: -6))
//
//    }
//}

//struct ChatListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatListView()
//    }
//}
