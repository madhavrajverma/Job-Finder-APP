//
//  ImagePicker.swift
//  ImagePicker
//
//  Created by Madhav Raj Verma on 21/01/22.
//


import Foundation
import SwiftUI
import UIKit

import Photos

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var image: UIImage?
    @Binding var isShown: Bool
    @Binding  var isSuccefullyFetch:Bool
    @Binding var filename: String
    @Binding var imageExt:String
    
    init(image: Binding<UIImage?>, isShown: Binding<Bool>,isSuccefullyFetch:Binding<Bool>,filename: Binding<String>,imageExt:Binding<String>) {
        _image = image
        _isShown = isShown
        _isSuccefullyFetch = isSuccefullyFetch
        _filename  = filename
        _imageExt = imageExt
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
        
    
        
        if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            image = uiImage
            isShown = false
            isSuccefullyFetch = true
        }
        
        guard let fileUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL else { return }
             filename = fileUrl.lastPathComponent // get file Name
             imageExt = fileUrl.pathExtension
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
    
}


struct ImagePicker: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = ImagePickerCoordinator
    
    @Binding var image: UIImage?
    @Binding var isShown: Bool
    @Binding  var isSuccefullyFetch:Bool
    @Binding var filename:String
    @Binding var imageExt:String
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePickerCoordinator(image: $image, isShown: $isShown,isSuccefullyFetch:$isSuccefullyFetch,filename: $filename, imageExt: $imageExt)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
        
    }
    
}
