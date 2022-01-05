//
//  keyboardHandler.swift
//  keyboardHandler
//
//  Created by Madhav Raj Verma on 05/01/22.
//

import Foundation
import SwiftUI
import Combine

final class KeyboardHandler:ObservableObject {
    @Published private(set) var keyboardHeight : CGFloat  = 0
    
    private var cancellabele:AnyCancellable?
    
    
    private let keyboardwillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .compactMap{ ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height}
    
    
    
    private let keyboardwillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map{_ in CGFloat.zero}
    
    init() {
        cancellabele = Publishers.Merge(keyboardwillShow,keyboardwillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.self.keyboardHeight, on: self)
    }
    
}
