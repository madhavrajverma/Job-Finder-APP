//
//  EditProfile.swift
//  EditProfile
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI
import URLImage

struct EditProfile: View {
    
    @State  var newName:String = ""
    @State  var newEmail:String = ""
//    @State  var image: UIImage?
    @State private var isImagePicker:Bool = false
    @EnvironmentObject var userVm :UserViewModel
    @State private var isProfilePicture = false
   
    @State private var isSuccefullyUploadImage = false
    
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
                
                
                VStack {
                    Button(action: {
                        isProfilePicture = true
                    }) {
                        if let userImage =  userVm.user?.userImage {
                                if let url = URL(string: userImage)  {
                                    URLImage(url) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(Circle())
                                            .shadow(radius: 2)
                                            .frame(width:180,height: 180)
                                    }
                                }
                        }else {
                            Image("man")
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .shadow(radius: 2)
                                .frame(width:180,height: 180)
                        }
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
                    .alert(isPresented: $userVm.isSuccess, content: {
                        Alert(title: Text("Email password Update Succesfully"), dismissButton: .cancel(Text("Ok")))
                    })
                    .padding(.vertical)
                Spacer(minLength: 0)
                
            }
            .fullScreenCover(isPresented: $isProfilePicture, content: {
                UploadImageView()
            })
            .padding()
            .onAppear(perform: {
                
            })
              
    
                
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }.background(Color("Color").edgesIgnoringSafeArea(.all))
           
    }
    
        var saveChangeBtn:some View {
            Button(action:{
                userVm.updateUserProfile(self.newName, email: self.newEmail) {

                }
                
                
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


//
//
//if isSuccefullyFetch {
//    if let image = image {
//        Image(uiImage:image)
//            .resizable()
//            .scaledToFit()
//            .clipShape(Circle())
//            .shadow(radius: 2)
//            .frame(width:170,height: 170)
//    }
//}
//
//
//else {
//      if let userImage =  userVm.user?.userImage {
//          if let url = URL(string: userImage)  {
//              URLImage(url) { image in
//                  image
//                      .resizable()
//                      .scaledToFit()
//                      .clipShape(Circle())
//                      .shadow(radius: 2)
//                      .frame(width:200,height: 200)
//              }
//          }
//      }
//  }
