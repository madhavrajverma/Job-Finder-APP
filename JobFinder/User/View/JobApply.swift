//
//  JobApply.swift
//  JobApply
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import SwiftUI

struct JobApply: View {
    
    @State private var name: String = ""
    @State private var email :String = ""
    @State private var country :String = ""
    @State private var message :String = ""
    
    @State  var jobSuccefulyApplied = false
    
    let job: Job
    
    @State private var isTakeDocument  = false
    @Environment(\.presentationMode) var presenationMode
    
    @EnvironmentObject var jobVM:JobViewModel
    
    @EnvironmentObject var notificationVM:NotificationViewModel
    
    @State private  var isFileName :Bool = false
    @State var data : Data?

    @State private var fileName :String = ""
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
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
                    }.padding(.leading)

                    
                    Text("Job Apply")
                        .font(.largeTitle)
                        .foregroundColor(.black.opacity(0.8))
                    
                    VStack(alignment:.leading) {
                        VStack(alignment:.leading,spacing: 5) {
                            Text("Name")
                                .font(.title3)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                            
                            TextField("",text: $name)
                                .padding(.horizontal)
                                .textFieldStyle(SuperCustomTextFieldStyle())
                        }
                        
                        VStack(alignment:.leading) {
                            Text("Email")
                                .font(.title3)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                            
                            TextField("",text: $email)
                                .padding(.horizontal)
                                .textFieldStyle(SuperCustomTextFieldStyle())
                                                    }
                        
                        
                        VStack(alignment:.leading) {
                            Text("Country")
                                .font(.title3)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                            
                            TextField("",text: $country)
                                .padding(.horizontal)
                                .textFieldStyle(SuperCustomTextFieldStyle())
                        }
                        
                        
                        VStack(alignment:.leading) {
                            Text("Message")
                                .font(.title3)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                            
                            TextEditor(text: $message)
                                .border(Color.gray.opacity(0.3))
                                .cornerRadius(5)
                                .frame(width:UIScreen.main.bounds.width - 40, height:150)
                                .padding(.vertical)
                                .padding(.horizontal)
                        }
                        
                        uploadResume
                       
                        applyBtn
                        
                        NavigationLink("", isActive: $isTakeDocument) {
                            DocumentView(data: $data, fileName: $fileName, isFileName: $isFileName)
                        }
                      
                    }
                }
                .padding()
            
            
        }.alert(isPresented: $jobSuccefulyApplied, content: {
            Alert(title: Text("Job Succefully Applied"), message: Text("Wait for response job admin will reply you in 2 to 3 days"), dismissButton: .cancel(Text("Ok")))
        })
        .background(Color("Color").edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)

       
        
    }
    
    var uploadResume:some View {
        VStack(alignment:.leading) {
            Text("CV")
                .font(.title3)
                .foregroundColor(.gray)
                .padding(.horizontal)
            Button(action:{
                self.isTakeDocument = true
            }) {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .frame(width:UIScreen.main.bounds.width - 40, height:100)
                  
                    .overlay(
                        VStack {
                            if isFileName {
                                Text("\(fileName)") .foregroundColor(.gray)
                            }else {
                                Text("Upload Resume") .foregroundColor(.gray)
                            }
                               
                            Image(systemName: "doc.fill")
                                .foregroundColor(Color("fgColor"))
                        }
                            .padding()
                    )
            }
            .padding()
        }
    }
    
    
    var applyBtn:some View {
        Button(action:{
            if let data = data {
                let applyData = ApplyJobData(email: email, resumeUrl: "", message: message, country: country)
                jobVM.ApplyForJob(data, jobID: job._id, filename: "\(UUID().uuidString)\(fileName)" ,applyData: applyData) {result in
                    switch result {
                    case .success(_):
                        let mesagge = "\(name) is applied for "
                        let jobPost = job.title
                        let id = job.user
                        let postNotificationData = PostNotificationModel(id: id, notification: mesagge, job: jobPost)
                        notificationVM.PostNotification(notificationData: postNotificationData) { result in
                            switch result {
                            case .success(let succes):
                                self.jobSuccefulyApplied = succes
                            case .failure(let error):
                                print(error)
                            }
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }) {
            Text("Apply Now")
                .foregroundColor(.white)
                .fontWeight(.bold)
               
                .padding()
                .frame(maxWidth:.infinity)
                .background(Color("fgColor").cornerRadius(10).shadow(color: Color("Mlight"), radius: 5, x: 4, y: 4))
                .padding(.horizontal,20)
            
        }
    }
}

//struct JobApply_Previews: PreviewProvider {
//    static var previews: some View {
//        JobApply()
//    }
//}


struct SuperCustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding()
            .cornerRadius(8)
            .background(Color.white.cornerRadius(8))
            .border(Color.gray.opacity(0.3))
          
    }
}

