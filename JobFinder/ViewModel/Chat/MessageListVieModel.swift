//
//  MessageVieModel.swift
//  MessageVieModel
//
//  Created by Madhav Raj Verma on 05/01/22.
//

import Foundation


struct Message:Identifiable {
    var id = UUID()
    let message:String
    let username:String
}



struct MessageViewModel {
    
    let message: Message
    
    var messageText: String {
        message.message
    }
    
    var username: String {
        message.username
    }
    
}



class MessageListViewModel: ObservableObject {


    @Published var messages: [Message] = []
    
    init() {
    messages = [
            
            Message(message: "Hii",username: "Madhav"),
            Message(message: "Hello",username: "Rajnish"),
            Message(message: "Hii",username: "Madhav"),
            Message(message: "Hello",username: "Rajnish"),
            Message(message: "Hii",username: "Madhav"),
            Message(message: "Hello",username: "Rajnish"),
            Message(message: "Hii",username: "Madhav"),
            Message(message: "Hello",username: "Rajnish"),
            Message(message: "Hii",username: "Madhav"),
            Message(message: "Hello",username: "Rajnish"),
            
        ]
    }
    
    
}


