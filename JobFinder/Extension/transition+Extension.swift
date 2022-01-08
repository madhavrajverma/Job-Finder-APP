//
//  transition+Extension.swift
//  transition+Extension
//
//  Created by Madhav Raj Verma on 09/01/22.
//

import Foundation
import SwiftUI


extension AnyTransition {
    static var scaleAndOffset: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .scale(scale: 0, anchor: .bottom),
            removal: .offset(x: -600, y: 00)
) }
}
