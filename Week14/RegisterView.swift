//
//  RegisterView.swift
//  Week14
//
//  Created by Yundong Lee on 2021/12/27.
//

import UIKit

class RegisterView: UIView, ViewRepresentable {
    let emailTextField = UITextField()
    let userNameTextField = UITextField()
    let passwordTextField = UITextField()
    let signInButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUpView() {
        addSubview(emailTextField)
        addSubview(userNameTextField)
        addSubview(passwordTextField)
        addSubview(signInButton)
        
        emailTextField.backgroundColor = .gray
        userNameTextField.backgroundColor = .gray
        passwordTextField.backgroundColor = .gray
        signInButton.backgroundColor = .gray
        
    }
    
    func setUpConstraints() {
        userNameTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.bottom.equalTo(userNameTextField.snp.top).offset(-20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(userNameTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
    }
}
