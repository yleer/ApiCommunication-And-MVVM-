//
//  SignUpView.swift
//  Week14
//
//  Created by Yundong Lee on 2021/12/27.
//

import UIKit
import SnapKit

protocol ViewRepresentable {
    func setUpView()
    func setUpConstraints()
}


class SignInView: UIView, ViewRepresentable {
    
    let toRegisterButton = UIButton()
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
        addSubview(toRegisterButton)
        addSubview(userNameTextField)
        addSubview(passwordTextField)
        addSubview(signInButton)
        
        toRegisterButton.backgroundColor = .red
        userNameTextField.backgroundColor = .gray
        passwordTextField.backgroundColor = .gray
        signInButton.backgroundColor = .gray
        
    }
    
    func setUpConstraints() {
        
        toRegisterButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(150)
        }
        
        userNameTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
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
