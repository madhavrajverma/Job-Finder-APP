//
//  ChatDetailView.swift
//  ChatDetailView
//
//  Created by Madhav Raj Verma on 05/01/22.
//


import SwiftUI
import Combine
import Introspect



struct ChatDetailView: View {
    @State var uiTabarController: UITabBarController?
    
    
    @StateObject private var messageListVM = MessageListViewModel()
    
    @StateObject private var keyboardHanlder = KeyboardHandler()

    @Environment(\.presentationMode)  var presentationMode: Binding<PresentationMode>
    @State private var username:String = "Madhav"
    @State private var message: String = ""
    @State private var cancellable:AnyCancellable?
  
    
//    @State var scroolToIndex:Int = 0
        
    var body: some View {
        VStack {
            VStack {
                HStack {
                    ChatProfileBar()
                }
            }
            
            ScrollView {
                ScrollViewReader {scrollView in
                    VStack {
                        ForEach(messageListVM.messages) {
                            message in
                            HStack {
                                if message.username == username {
                                    Spacer()
                                    MessageView(username: message.username, messageText: message.message, style: .primary)
                                }else {
                                    MessageView(username: message.username, messageText: message.message, style: .secondary)
                                    Spacer()
                                }
                            }.padding()
                                .id(message.id)
                        }
                    }.offset(y:-keyboardHanlder.keyboardHeight)
                        .onAppear(perform: {
                                
                            cancellable = messageListVM.$messages.sink { messages in
                                if messages.count > 0 {
                                    DispatchQueue.main.async {
                                        withAnimation {
                                            
                                            scrollView.scrollTo(messages[messages.endIndex - 1].id, anchor: .bottom)
                                            
                                        }
                                    }
                                }
                            }
                              
                        })

                    
                }
            }
            HStack {
                TextField("Write message here", text: $message)
                    .modifier(customTextFieldModifier())
                
                Button(action: {
                    let  newMessage =  Message(message: message,username: "Madhav")
                    self.messageListVM.messages.append(newMessage)
                    self.message = ""
                    
        
                    //                        sendMessage()
                    
                }, label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title)
                        .foregroundColor(Color("fgColor"))
                        
                })
            }
            .background(Color.white)
            .offset(y:-keyboardHanlder.keyboardHeight)
            .animation(.default)
          
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
      
        .introspectTabBarController { (UITabBarController) in
                   UITabBarController.tabBar.isHidden = true
                   uiTabarController = UITabBarController
               }.onDisappear{
               
                       uiTabarController?.tabBar.isHidden = false
                   
               }
    }

    
}


//struct ChatDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatDetailView()
//    }
//}
