//
//  CharScreen.swift
//  CharScreen
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI


struct User : Identifiable {
    let id = UUID()
    let name:String
    let image:String
    let message:String
}


var users:[User] = [
    
    User(name: "Mike", image: "mike", message: "What about paypal?"),
    User(name: "Robert", image: "steve", message: "Let 's have a call for future projects"),
    User(name: "Henry", image: "henry", message: "Can we talk more about you?"),
    User(name: "Mike", image: "mike", message: "What about paypal?"),
    User(name: "Robert", image: "steve", message: "Let 's have a call for future projects"),
    User(name: "Henry", image: "henry", message: "Can we talk more about you?")

    
]


struct ChatScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                    Text("Messages")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                   
                        List {
                            ForEach(users) { user in
                                NavigationLink(destination: ChatDetailView()) {
                                    MessageUserView(image: user.image, name: user.name, message: user.message)
                                }
                               
                            }.onDelete(perform: removeUser)
                        }.listStyle(.plain)
                
            
        }            .navigationBarHidden(true)

    }
    
        
}
    func removeUser(at offsets:IndexSet) {
        users.remove(atOffsets: offsets)
    }
    
}

struct ChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatScreen()
    }
}


struct MessageUserView: View {
    let image:String
    let name:String
    let message:String
    var  body :some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width:50,height: 50)
                .padding()
            
            VStack(alignment:.leading) {
                Text(name)
                    .font(.body)
                    .foregroundColor(.black.opacity(0.7))
                
                Text(message)
                    .font(.headline)
                    .foregroundColor(.gray.opacity(0.5))
                    .lineLimit(1)
                
            }
        }
    }
}
