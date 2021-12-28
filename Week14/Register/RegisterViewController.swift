//
//  RegisterViewController.swift
//  Week14
//
//  Created by Yundong Lee on 2021/12/27.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let mainView = RegisterView()
    let viewModel = RegisterViewModel()
    
    override func loadView() {
        super.loadView()
        self.view = mainView
                    
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .white
        
        viewModel.email.bind { text in
            self.mainView.emailTextField.text = text
        }
        
        viewModel.userName.bind { text in
            self.mainView.userNameTextField.text = text
        }
        
        viewModel.password.bind { text in
            self.mainView.passwordTextField.text = text
        }
        
        mainView.emailTextField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        
        mainView.userNameTextField.addTarget(self, action: #selector(userNameTextFieldChanged), for: .editingChanged)
        
        mainView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
        
        mainView.signInButton.addTarget(self, action: #selector(registerButton), for: .touchUpInside)
        
    }
    
    @objc func emailTextFieldChanged(_ textField: UITextField) {
        viewModel.email.value = textField.text ?? ""
    }
    
    @objc func userNameTextFieldChanged(_ textField: UITextField) {
        viewModel.userName.value = textField.text ?? ""
    }
    
    @objc func passwordTextFieldChanged(_ textField: UITextField) {
        viewModel.password.value = textField.text ?? ""
    }
    

    @objc func registerButton() {
        
        viewModel.postRegister {
            DispatchQueue.main.async {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }

                windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: MainViewController())
                windowScene.windows.first?.makeKeyAndVisible()

            }
        }
        
        
    }

}
