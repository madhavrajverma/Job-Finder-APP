//
//  text+Extension.swift
//  text+Extension
//
//  Created by Madhav Raj Verma on 05/01/22.
//

import Foundation
import SwiftUI

extension Text {
    
    func withPrimaryTextStyle() -> some View {
     return
        self
            .padding(10)
            .foregroundColor(Color.white)
            .background(Color("fgColor"))
            .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
    }
    
    func withSecondaryTextStyle() -> some View {
        return self
            .padding(10)
            .foregroundColor(Color.black)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
        
    }
}
