//
//  UIImage+extension.swift
//  UIImage+extension
//
//  Created by Madhav Raj Verma on 21/01/22.
//

import Foundation
import UIKit

extension UIImage {
    
     func aspectFiittedToHeight(_ newHeight:CGFloat) -> UIImage {
         _ = newHeight / self.size.height
        let newWidth = self.size.width
        let newSize = CGSize(width: newWidth, height: newHeight)
        
        let render = UIGraphicsImageRenderer(size:newSize)
        
        return render.image { _ in
            self.draw(in: CGRect(origin:.zero,size:newSize))
        }
        
    }
}

func compressImage(image :UIImage) -> UIImage {
    let resizedImage = image.aspectFiittedToHeight(200)
    return resizedImage
}
