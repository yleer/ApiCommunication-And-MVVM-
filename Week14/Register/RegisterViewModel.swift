//
//  RegisterViewModel.swift
//  Week14
//
//  Created by Yundong Lee on 2021/12/27.
//

import Foundation

class RegisterViewModel {
    
    var userName: Observalble<String> = Observalble("")
    var email: Observalble<String> = Observalble("")
    var password: Observalble<String> = Observalble("")
    
    
    func postRegister(completion: @escaping () -> Void) {
    
        ApiService.register(username: userName.value, email: email.value, password: password.value) { user, error in
            guard let userData = user else{
                return
            }
            
            UserDefaults.standard.set(userData.jwt, forKey: "token")
            UserDefaults.standard.set(userData.user.username, forKey: "userName")
            UserDefaults.standard.set(userData.user.id, forKey: "id")
            UserDefaults.standard.set(userData.user.email, forKey: "email")
            
            completion()
        }
        
        
    }
    
}
