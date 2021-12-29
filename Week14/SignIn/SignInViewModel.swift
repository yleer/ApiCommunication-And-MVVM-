//
//  SignInViewModel.swift
//  Week14
//
//  Created by Yundong Lee on 2021/12/27.
//

import Foundation


class SignInViewModel {
    
    var userName: Observalble<String> = Observalble("aa")
    var password: Observalble<String> = Observalble("")
    
    
    func postUserLogin(completion: @escaping () -> Void) {
        ApiService.login(id: userName.value, pass: password.value) { user, error in
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
    
    func getUserNmae() {
        userName.value = UserDefaults.standard.string(forKey: "userName") ?? ""
    }
}
