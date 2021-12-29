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
                        Text("File Name:\(fileName)")
                        
                        Button("Take Resume From Library") {
                          self.showDocPicker.toggle()
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
