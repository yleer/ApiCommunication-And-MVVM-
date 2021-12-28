//
//  ViewController.swift
//  Week14
//
//  Created by Yundong Lee on 2021/12/27.
//

import UIKit

class SignInViewController: UIViewController {
    
    let mainView = SignInView()
    let viewModel = SignInViewModel()
    
    override func loadView() {
        self.view = mainView
        
        if let _ = UserDefaults.standard.string(forKey: "token"){
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            
            windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: MainViewController())
            windowScene.windows.first?.makeKeyAndVisible()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        mainView.backgroundColor = .white
        viewModel.userName.bind { text in
            self.mainView.userNameTextField.text = text
        }

        viewModel.password.bind { text in
            self.mainView.passwordTextField.text = text
        }

        mainView.toRegisterButton.addTarget(self, action: #selector(segueToRegister), for: .touchUpInside)
        
        mainView.userNameTextField.addTarget(self, action: #selector(userNameTextFieldDidChange), for: .editingChanged)

        mainView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange), for: .editingChanged)
       
        mainView.signInButton.addTarget(self, action: #selector(signInButton), for: .touchUpInside)
    }
    
    @objc func segueToRegister() {
        let vc = RegisterViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    @objc func userNameTextFieldDidChange(_ textField: UITextField) {
        viewModel.userName.value = textField.text ?? ""
    }

    @objc func passwordTextFieldDidChange(_ textField: UITextField) {
        viewModel.password.value = textField.text ?? ""
    }

    
    @objc func signInButton() {
        
        viewModel.postUserLogin {
            DispatchQueue.main.async {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }

                windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: MainViewController())
                windowScene.windows.first?.makeKeyAndVisible()

            }
        }
    }
        
//        ApiService.login(id: mainView.userNameTextField.text!, pass: mainView.passwordTextField.text!) { user, error in
//            guard let userData = user else{
//                return
//            }
//
//            UserDefaults.standard.set(userData.jwt, forKey: "token")
//            UserDefaults.standard.set(userData.user.username, forKey: "userName")
//            UserDefaults.standard.set(userData.user.id, forKey: "id")
//            UserDefaults.standard.set(userData.user.email, forKey: "email")
//
//            DispatchQueue.main.async {
//                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
//
//                windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: MainViewController())
//                windowScene.windows.first?.makeKeyAndVisible()
//
//            }
//        }
    

}

