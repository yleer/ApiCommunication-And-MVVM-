//
//  ViewController.swift
//  Week14
//
//  Created by Yundong Lee on 2021/12/27.
//

import UIKit

class SignInViewController: UIViewController {
    
    let mainView = SignInView()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        mainView.signInButton.addTarget(self, action: #selector(signInButton), for: .touchUpInside)
    }

    
    @objc func signInButton() {
        ApiService.login(id: mainView.userNameTextField.text!, pass: mainView.passwordTextField.text!) { user, error in
            guard let userData = user else{
                return
            }
            
            UserDefaults.standard.set(userData.jwt, forKey: "token")
            UserDefaults.standard.set(userData.user.username, forKey: "userName")
            UserDefaults.standard.set(userData.user.id, forKey: "id")
            UserDefaults.standard.set(userData.user.email, forKey: "email")
            
            
            
            DispatchQueue.main.async {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                
                windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: MainViewController())
                windowScene.windows.first?.makeKeyAndVisible()
        
            }
            
            
            
        }
    }

}

