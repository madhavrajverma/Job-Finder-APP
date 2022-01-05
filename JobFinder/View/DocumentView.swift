//
//  DocumentView.swift
//  DocumentView
//
//  Created by Madhav Raj Verma on 29/12/21.
//

import SwiftUI


struct DocumentView: View {
    @State private var showDocPicker = false
    @Binding var data : Data?
    @State private var isPdfPreview :Bool = false
    @State private var url:URL?
    @Binding  var fileName :String
    @Binding var isFileName:Bool
    @Environment(\.presentationMode) var presenationMode
    var body: some View {
       
            VStack {
                if (isPdfPreview) {
                    if let data = data {
                        PDFKitRepresentedView(data,singlePage: true)
                    }
                 
                }else {
                    VStack {
                        
                        HStack {
                          Spacer()
                            Text("File Name:")
                                .font(.title)
                                .foregroundColor(.gray)
                            Spacer()
                            if isFileName {
                                Text("\(fileName)")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .padding()
                                    .background(Color("buttonColor").opacity(0.4).cornerRadius(10))
                            }else {
                                Text("No File")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .padding()
                                    .background(Color("buttonColor").opacity(0.4).cornerRadius(10))
                            }
                            Spacer()
                            
                        }
                             
                        
                        
                        Button(action :{self.showDocPicker.toggle()}) {
                            
                            Text("Take Resume From Library")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                               
                                .padding()
                                .frame(maxWidth:.infinity)
                                .background(Color("fgColor").cornerRadius(10).shadow(color: Color("Mlight"), radius: 5, x: 4, y: 4))
                                .padding(.horizontal,20)
                        }
                    }
                }
            }.sheet(isPresented: $showDocPicker) {
                DocumentPicker(pdfPreview:$isPdfPreview, filePath: $url, data: $data)
        }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action:{
                        self.isPdfPreview = false
                        let theFileName = url?.lastPathComponent
                        if let fileName = theFileName {
                            self.fileName = fileName
                            self.isFileName = true
                        }
                        presenationMode.wrappedValue.dismiss()
                    }) {
                        Text("Done")
                    }
                }
            }
        
     }
}

//struct DocumentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DocumentView()
//    }
//}
