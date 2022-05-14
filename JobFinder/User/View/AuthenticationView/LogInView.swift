//
//  LogInView.swift
//  LogInView
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI

enum States  {
    case loading , finish
}

struct LogInView: View {
    
    @State private var states:States = .finish
    @State private var email:String = ""
    @State private var password :String = ""
    @State private var isSignUp:Bool = false
    @StateObject private var loginVM = LoginViewModel()
    @StateObject private var userVM = UserViewModel()
    @State private var isAuthenticated:Bool = false
    @State private var isRole = "user"
    
    var body: some View {
//        ScrollView(.vertical,showsIndicators: false) {
        if loginVM.auth  && loginVM.isRole == "user" {
            ContentView()
               
                .transition(.scaleAndOffset)
            
                 .environmentObject(loginVM)
        }else if loginVM.auth && loginVM.isRole == "company"{
            CompanyViewTab()
                .environmentObject(loginVM)
        } else {
            ZStack {
                VStack(spacing:10) {
                
                        
                        HStack{
                            VStack(alignment:.leading,spacing: 5){
                                Text("Welcome Back!")
                                    .font(.system(size: 40))
                                    .fontWeight(.bold)
                                    .opacity(0.7)
                             
                                VStack(alignment:.leading){
                            
                            Text("Fill yor details or continue")
                                .font(.body)
                                .foregroundColor(.gray)
                             
                            
                            Text("with social media")
                                .font(.body)
                                .foregroundColor(.gray)
                               
                        }
                          
                    
                            }
                            Spacer(minLength: 0)
                        }.padding(.leading)
                        .padding(.vertical)
                        .padding(.top)
                        
                        VStack() {
                            HStack {
                                Image(systemName: "envelope")
                                    .foregroundColor(.gray)
                                TextField("Email",text:$email)
                            }
                            
                            .modifier(customTextFieldModifier())
                            
                            HStack {
                                Image(systemName: "lock")
                                SecureField("Password",text: $password)
                                
                            } .modifier(customTextFieldModifier())
                            
                        }
                        .padding()
                        
                        Text("Or Continue With")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        HStack {
                            Spacer(minLength: 0)
                            googleBtn
                                .padding(.horizontal,10)
                            facebookBtn
                                .padding(.horizontal,10)
                            Spacer(minLength: 0)
                        }.padding(.vertical,5)
                      
                    VStack{
                        
                        forgotPassword
                        
                        logInButton
                            .padding(.vertical,10)
                        
                        
                        HStack{
                            Text("New User?")
                                .font(.headline)
                                .foregroundColor(.gray)
                            Button(action:{
                                isSignUp = true
                            }) {
                                Text("Create Account")
                                    .foregroundColor(.black.opacity(0.6))
                                    .font(.body)
                                    .fontWeight(.bold)
                            }
                        }
                    }
        //
        //            .fullScreenCover(isPresented: $loginVM.auth, content: {
        //                ContentView()
        //            })
                        Spacer()
                        
                }
                
                if loginVM.isLoading {
                    LoadingView()
                }
            }.background(Color("Color").edgesIgnoringSafeArea(.all))
                .sheet(isPresented: $isSignUp) {
                    SignUpView()
                }
        }
           
//        }
    }
    
    var forgotPassword :some View {
        Button(action:{}) {
            Text("Forgot Your Password")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.gray)
        }.padding(.vertical,5)
    }
    
    var logInButton:some View {
        Button(action:{
            loginVM.email = email
            loginVM.paswword = password
            self.states = .loading
            loginVM.login {
                userVM.getUser()
                if let role = userVM.user?.role {

                  print(role)
                }
            }
            
            if  loginVM.auth {
              
            }
           
        }) {
            Text("LOG IN")
                .foregroundColor(.white)
                .fontWeight(.bold)
               
                .padding()
                .frame(maxWidth:.infinity)
                .background(Color("fgColor").cornerRadius(10).shadow(color: Color("Mlight"), radius: 5, x: 4, y: 4))
                .padding(.horizontal,20)
            
        }
    }
    
    var googleBtn :some View {
        Button(action:{}){
            Image("google")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .shadow(color: Color("bgColor"), radius: 5, x: 4, y: 4)
        }
    }
    
    var facebookBtn :some View {
        Button(action:{}){
            Image("facebook")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .shadow(color: Color("bgColor"), radius: 5, x: 4, y: 4)
        }
            
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}




