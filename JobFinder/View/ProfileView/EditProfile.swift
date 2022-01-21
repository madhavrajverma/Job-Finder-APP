//
//  EditProfile.swift
//  EditProfile
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI

struct EditProfile: View {
    
    @State private var newName:String = ""
    @State private var newEmail:String = ""
    @Binding var image: UIImage?
    @State private var isImagePicker:Bool = false
    @EnvironmentObject var userVm :UserViewModel
    
    @Environment(\.presentationMode) var presenationMode
    
    var body: some View {
        ScrollView{
            VStack {
                
                HStack {
                    Button(action:{
                        presenationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.body)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("fgColor").cornerRadius(8).shadow(color: Color("Mlight"), radius: 5, x: 4, y: 4))
                    }
                    Spacer(minLength: 0)
                }
                
                Text("Edit Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                Button(action :{
                    self.isImagePicker = true
                }){
                    ZStack {
                        if let image = image {
                            Image(uiImage:image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .shadow(radius: 2)
                                .frame(width:170,height: 170)
                        }
                        
                        Image(systemName: "pencil.circle.fill")
                            .foregroundColor(.white)
                            .padding(2)
                            .background(Color("fgColor").cornerRadius(10))
                            .offset(x:20,y:61)
                    }
        
                    
                }
                
                VStack(alignment:.leading) {
                    Text("Name")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                    TextField("New Name",text: $newName)
                        .padding(.horizontal)
                        .textFieldStyle(SuperCustomTextFieldStyle())
                    
                }
                
                VStack(alignment:.leading) {
                    Text("Email")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                    TextField("New Email",text: $newEmail)
                        .padding(.horizontal)
                        .textFieldStyle(SuperCustomTextFieldStyle())
                
                }
                
                saveChangeBtn
                    .padding(.vertical)
                Spacer(minLength: 0)
                
            }.padding()
                .alert(isPresented: $userVm.isSuccess, content: {
                    Alert(title: Text("Email password Update Succesfully"), dismissButton: .cancel(Text("Ok")))
                })
                .onDisappear(perform: {
                    userVm.getUser()
                })
                
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }.background(Color("Color").edgesIgnoringSafeArea(.all))
            .sheet(isPresented: $isImagePicker) {
                ImagePicker(image: $image, isShown: $isImagePicker)
            }
    }
    
        var saveChangeBtn:some View {
            Button(action:{
                userVm.updateUserProfile(self.newName, email: self.newEmail)
               
            }) {
                Text("Save Changes")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                   
                    .padding()
                    .frame(maxWidth:.infinity)
                    .background(Color("fgColor").cornerRadius(10).shadow(color: Color("Mlight"), radius: 5, x: 4, y: 4))
                    .padding(.horizontal,20)
                
            }
        }
}

//struct EditProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfile()
//    }
//}
