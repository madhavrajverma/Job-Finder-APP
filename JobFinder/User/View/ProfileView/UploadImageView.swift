//
//  UploadImageView.swift
//  JobFinder
//
//  Created by Lakshya  Verma on 08/05/22.
//

import SwiftUI

struct UploadImageView: View {
   
    @State  var image: UIImage? = UIImage(named: "user")!
    @State private var filename = ""
    
    @Environment(\.presentationMode) var presenationMode
    @State private var isSuccefulUpload = false
    @EnvironmentObject var userVm :UserViewModel
    
    @State private var isSuccefullyFetch:Bool = false
    @State private var isImagePicker:Bool = false
    @State private var imageExt:String = ""
    
    var body: some View {
        GeometryReader  { geo in
            
            VStack {
                HStack {
                    Button(action:{
                        presenationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.body)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("fgColor").cornerRadius(8))
                        
                    }
                    
                    Spacer(minLength: 0)
                }.padding(.leading)
                
                HStack {
                    Spacer()
                    Text("Profile Picture")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            .padding(.top)
            
            VStack {
 
                VStack {
                    Spacer()
                    Image(uiImage: image ?? UIImage(named: "user")!)
                        .resizable()
                        .scaledToFit()
                        .border(Color.white)
                        .frame(width: geo.size.width, height: geo.size.height * 0.6,alignment: .center)
                      Spacer()
                }
                
                
                HStack(spacing:40) {

                        
                    Button(action : {
                        guard let imageData = image?.pngData() else {
                            print("Unable to convert into data")
                            return
                        }
                        print(imageExt)
                        userVm.chnageProfilePic(imageData, filename: filename,fileExt: imageExt) { result  in
                            switch result {
                            case .success(let succes):
                                self.isSuccefulUpload = succes
                                 print(succes)
                            case .failure(let error):
                                print(error.localizedDescription)
                                
                            }
                        }
                    }){
                        Text("Upload Image")
                            .font(.body)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("fgColor"))
                            .cornerRadius(8)
                    }
                    
                    Button(action : {
                        isImagePicker = true
                    }){
                        HStack(spacing:10)  {
                            Image(systemName: "camera")
                                .font(.body)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color("fgColor"))
                                .cornerRadius(10)
                        }
                    }
                }.padding(.bottom,20)
            
            }
            .alert(isPresented: $isSuccefulUpload) {
                Alert(title: Text("Uploaded Succesfull"), message: Text("You have succesfully changed your profile picture"), dismissButton: .cancel())
            }

        } .sheet(isPresented: $isImagePicker) {
            ImagePicker(image: $image, isShown: $isImagePicker, isSuccefullyFetch: $isSuccefullyFetch, filename: $filename, imageExt: $imageExt)
        }
    }
    
}

struct UploadImageView_Previews: PreviewProvider {
    static var previews: some View {
        UploadImageView()
        
    }
}
