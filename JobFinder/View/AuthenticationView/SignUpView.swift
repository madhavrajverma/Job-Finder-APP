//
//  SignUpView.swift
//  SignUpView
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI

struct SignUpView: View {
    @State private var email:String = ""
    @State private var password :String = ""
    @State private var userName:String = ""
    @StateObject private var registerVM = RegisterViewModel()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(spacing:10) {
                HStack{
                    VStack(alignment:.leading,spacing: 5){
                        Text("Register Account")
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
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                        TextField("User Name",text:$userName)
                    }
                    .modifier(customTextFieldModifier())
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
   
                SignUpBtn
                    .padding(.vertical,10)
                
                
                HStack{
                    Text("Already have Account?")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Button(action:{
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Log In")
                            .foregroundColor(.black.opacity(0.6))
                            .font(.body)
                            .fontWeight(.bold)
                    }
                }
            }
                Spacer()
                
        }.background(Color("Color").edgesIgnoringSafeArea(.all))
    }
    
    var SignUpBtn:some View {
        Button(action:{
            registerVM.name = userName
            registerVM.email = email
            registerVM.paswword = password
            registerVM.signUp {
                
            }
        }) {
            Text("SIGN UP")
                .foregroundColor(.white)
                .fontWeight(.bold)
               
                .padding()
                .frame(maxWidth:.infinity)
                .background(Color("fgColor").cornerRadius(10).shadow(color: Color("Mlight"), radius: 5, x: 4, y: 4))
                .padding(.horizontal,20)
            
        }
    }
    
    var googleBtn :some View {
        Button(action:{
            
        }){
            Image("google")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .shadow(color: Color("bgColor"), radius: 5, x: 4, y: 4)
        }
    }
    
    var facebookBtn :some View {
        Button(action:{
            
        }){
            Image("facebook")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .shadow(color: Color("bgColor"), radius: 5, x: 4, y: 4)
        }
            
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}



