//
//  CreateNewJobPostView.swift
//  JobFinder
//
//  Created by Lakshya  Verma on 02/05/22.
//

import SwiftUI

struct CreateNewJobPostView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
     @StateObject var addPostVM = AddPostViewModel()

     var industries = ["Business", "Information Technology", "Banking", "Educatoion/Training", "Telecomuniaction", "Other" ]
    
    var jobTypes = ["FullTime", "PartTime", "Internship"]
    
    var minEducation = [ "Bachelors", "Masters", "Phd"]
    
    var experiences = [  "No Experience", "1 Years - 2 Years", "2 Years - 5 Years", "5 Years+"]
  
    
    var body: some View {
        NavigationView {
         
                Form {
                    Section(header: Text("Job Details")) {
                        TextField("Title",text: $addPostVM.title)
                        TextField("Email",text: $addPostVM.email)
                        TextField("Company Name",text: $addPostVM.company)
                        TextField("Address",text: $addPostVM.address)
                        TextField("Salary" , text: $addPostVM.salary)
                    }
                    
                    Section(header: Text("Additional Details")) {
                        
                        Picker(selection: $addPostVM.industry,label: Text("Industry")) {
                            ForEach(industries,id:\.self) { industry in
                                Text(industry)
                            }
                        }
                        
                        Picker(selection: $addPostVM.jobType,label: Text("Job Type")) {
                            ForEach(jobTypes,id:\.self) { jobtype in
                                Text(jobtype)
                            }
                        }
                        
                        Picker(selection: $addPostVM.selectedMinEducation,label: Text("Min Education")) {
                            ForEach(minEducation,id:\.self) { minEd in
                                Text(minEd)
                            }
                        }
                        
                        TextField("Positions" ,text:$addPostVM.positions)
                        
                        Picker(selection: $addPostVM.selectedExperience,label: Text("Experience")) {
                            ForEach(experiences,id:\.self) { expe in
                                Text(expe)
                            }
                        }
                        
                    }
                    
                    Section(header: Text("Add Company Image")) {
                        HStack{
                            Image(uiImage: addPostVM.image ?? UIImage(named: "placeholder")!)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(8)
                                .frame(width: 60, height: 60)
                                
                            
                            Spacer()
                            
                            Button(action: {
                                addPostVM.isImagePicker = true
                            }) {
                                Text("Upload Image")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color("fgColor").cornerRadius(8))
                                
                            }
                        }
                        .padding()
                    }
                    
                    Section(header: Text("Description")) {
                        TextEditor(text:  $addPostVM.description)
                            .frame(height:180)
                    }
                }
                .sheet(isPresented: $addPostVM.isImagePicker) {
                    ImagePicker(image: $addPostVM.image, isShown: $addPostVM.isImagePicker, isSuccefullyFetch: $addPostVM.isSuccefullyFetch, filename: $addPostVM.filename, imageExt: $addPostVM.imageExt)
                }
                .navigationTitle("Post Form")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Dismiss")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            
                            addPostVM.addNewPost()
                        }) {
                            Text("Post")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(Color("fgColor"))
                        }
                    }
                }
            }
          
        
    }
}

struct CreateNewJobPostView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewJobPostView()
    }
}
