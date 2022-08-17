//
//  SignInView.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit
import SnapKit

class SignInView: UIView {
    
    let backgroundFone = UIImageView()
    let logoImageView = UIImageView()
    let loginLabel = UILabel()
    
    let emailTF = TextInput(icon: nil, isPassword: false)
    let passwordTF = TextInput(icon: nil, isPassword: true)
    
    let loginMethodLabel = UILabel()
    let loginViaFacebookButton = IconButton(icon: R.image.icon_facebook(), text: R.string.localization.signInLoginViaFacebookButton())
    let loginViaGoogleButton = IconButton(icon: R.image.icon_google(), text: R.string.localization.signInLoginViaGoogleButton())
    let forgotPasswordButton = UIButton(type: .system)
    let signUpButton = UIButton(type: .system)
    let signInButton = GreenButton()
    let activityIndicator = UIActivityIndicatorView()
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        
        addSubview(backgroundFone)
        addSubview(logoImageView)
        addSubview(loginLabel)
        addSubview(loginMethodLabel)
        addSubview(loginViaFacebookButton)
        addSubview(loginViaGoogleButton)
        addSubview(forgotPasswordButton)
        addSubview(signUpButton)
        addSubview(emailTF)
        addSubview(passwordTF)
        addSubview(signInButton)
        addSubview(activityIndicator)
        backgroundColor = .white
        
        logoImageView.image = R.image.logo()
        backgroundFone.image = R.image.background()
        
        loginLabel.text = R.string.localization.signInLoginLabel()
        loginLabel.font = .boldSystemFont(ofSize: 20)
        loginLabel.numberOfLines = 0
        loginLabel.textAlignment = .center
        loginLabel.textColor = R.color.text_black()
        
        emailTF.textField.placeholder = R.string.localization.signInEmailTFTextFieldPlaceholder()
        passwordTF.textField.placeholder = R.string.localization.signInPasswordTFTextFieldPlaceholder()
        
        loginMethodLabel.text = R.string.localization.signInLoginMethodLabel()
        loginMethodLabel.font = .boldSystemFont(ofSize: 12)
        loginMethodLabel.numberOfLines = 0
        loginMethodLabel.textAlignment = .center
        loginMethodLabel.textColor = UIColor(named: "text_black")
        loginMethodLabel.textColor = R.color.text_black()
        
        forgotPasswordButton.setTitle(R.string.localization.signInForgotPasswordButtonSetTitle(), for: .normal)
        forgotPasswordButton.tintColor = R.color.green_Global()
        
        signUpButton.setTitle(R.string.localization.signInSignUpButtonSetTitle(), for: .normal)
        signUpButton.tintColor = R.color.green_Global()
        
        activityIndicator.color = .black
        activityIndicator.style = .large
        
        signInButton.setTitle(R.string.localization.signInSignInButtonSetTitle(), for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.setTitleColor(.gray, for: .disabled)
    }
    private func setupConstraints() {
        backgroundFone.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(40)
        }

        emailTF.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginLabel.snp.bottom).offset(30)
            make.width.equalTo(325)
            make.height.equalTo(57)
        }

        passwordTF.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTF.snp.bottom).offset(12)
            make.width.equalTo(325)
            make.height.equalTo(57)
        }

        loginMethodLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTF.snp.bottom).offset(20)
        }
        
        loginViaFacebookButton.snp.makeConstraints { make in
            make.top.equalTo(loginMethodLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(25)
            make.width.equalTo(152)
        }
        
        loginViaGoogleButton.snp.makeConstraints { make in
            make.left.equalTo(loginViaFacebookButton.snp.right).offset(21)
            make.top.equalTo(loginMethodLabel.snp.bottom).offset(20)
            make.width.equalTo(152)
            make.height.equalTo(57)
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginViaFacebookButton.snp.bottom).offset(10)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginViaGoogleButton.snp.bottom).offset(20)
        }
        
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(36)
        }

        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signInButton.snp.bottom).offset(18)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-12)
        }
    }
}
