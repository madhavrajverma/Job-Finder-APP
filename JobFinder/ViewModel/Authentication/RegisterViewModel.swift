//
//  RegisterViewModel.swift
//  RegisterViewModel
//
//  Created by Madhav Raj Verma on 09/01/22.
//

import Foundation


class RegisterViewModel:ObservableObject {
    
    var name:String = ""
    var email :String  = ""
    var paswword :String = ""
    var role : String = "user"
    var userImage:String = "none"
    
    @Published var isLoading = false
    @Published var isSignUpSuccesFull = false
    
    
    @Published var isAuthenticated :Bool = false
    
    func signUp(completion:@escaping () -> Void) {
        
        let defualts = UserDefaults.standard
        self.isLoading = true
        
        AuthWebService().signUp(name:name,email: email, password: paswword) { result in
            
            switch result {
            case .success(let token):
                print(token)
                defualts.setValue(token, forKey: "jsonwebtoken")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                    self.isLoading = false
                    self.isSignUpSuccesFull = true
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
    }
    
}
