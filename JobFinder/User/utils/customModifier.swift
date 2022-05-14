//
//  customModifier.swift
//  customModifier
//
//  Created by Madhav Raj Verma on 25/12/21.
//

import Foundation
import SwiftUI



struct customTextFieldModifier:ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.white))
            .cornerRadius(10)
            .shadow(color: Color("bgColor"), radius: 2, x: 2, y: 2)
            .padding(.vertical,10)
    }
}


