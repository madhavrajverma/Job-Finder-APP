//
//  LoginViewModel.swift
//  LoginViewModel
//
//  Created by Madhav Raj Verma on 09/01/22.
//

import Foundation
import SwiftUI


class LoginViewModel:ObservableObject {
    
    
    var email :String  = ""
    
    var paswword :String = ""
    
    @Published  var  isLoading = false
    
    @Published var auth:Bool = UserDefaults.standard.bool(forKey: "auth") {
        didSet {
            UserDefaults.standard.set(auth, forKey: "auth")
        }
    }
    
    @Published var isAuthenticated :Bool = false
    
    func login(completion:@escaping () -> Void) {
        
        self.isLoading = true
        let defualts = UserDefaults.standard
        
        AuthWebService().login(email: email, password: paswword) { result in
            
            switch result {
            case .success(let token):
                print("log in succesfully")
                print(token)
                defualts.setValue(token, forKey: "jsonwebtoken")
//                UserDefaults.standard.bool(forKey: "auth")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                    self.auth = true
                    self.isLoading = false
                    print(self.isAuthenticated)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
    }
    
    func signOut() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "jsonwebtoken")
        DispatchQueue.main.async {
            self.isAuthenticated = false
            self.auth = false
        }
    }
}
