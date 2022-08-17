//
//  SignUpView.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit
import SnapKit

class SignUpView: UIView {
    
    let backgroundFone = UIImageView()
    let logoImageView = UIImageView()
    let loginLabel = UILabel()
    
    let userName = TextInput(icon: R.image.icon_username(), isPassword: false)
    let emailTF = TextInput(icon: R.image.icon_email(), isPassword: false)
    let passwordTF = TextInput(icon: R.image.icon_lock(), isPassword: true)
    let keepMeCheckBox = CheckBox(text: R.string.localization.signUpKeepMeCheckBox())
    let emailMeCheckBox = CheckBox(text: R.string.localization.signUpEmailMeCheckBox())
    let signUpButton = GreenButton()
    let activityIndicator = UIActivityIndicatorView()
    let stackView = UIStackView()
    let haveAnAccountButton = UIButton(type: .system)
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        
        addSubview(backgroundFone)
        addSubview(logoImageView)
        addSubview(loginLabel)
        addSubview(stackView)
        addSubview(userName)
        addSubview(emailTF)
        addSubview(passwordTF)
        addSubview(keepMeCheckBox)
        addSubview(emailMeCheckBox)
        addSubview(signUpButton)
        addSubview(activityIndicator)
        addSubview(haveAnAccountButton)
        
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillProportionally
        
        stackView.addArrangedSubview(userName)
        stackView.addArrangedSubview(emailTF)
        stackView.addArrangedSubview(passwordTF)
        
        logoImageView.image = R.image.logo()
        
        backgroundFone.image = R.image.background()
        
        loginLabel.text = R.string.localization.signUpLoginLabel()
        loginLabel.font = .boldSystemFont(ofSize: 20)
        loginLabel.numberOfLines = 0
        loginLabel.textAlignment = .center
        loginLabel.textColor = R.color.text_black()
        
        userName.textField.placeholder = R.string.localization.signUpUserNamePlaceholder()
        emailTF.textField.placeholder = R.string.localization.signUpEmailTFPlaceholder()
        passwordTF.textField.placeholder = R.string.localization.signUpPasswordTFPlaceholder()
    
        signUpButton.setTitle(R.string.localization.signUpSignUpButton(), for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.setTitleColor(.gray, for: .disabled)
        
        activityIndicator.color = .black
        activityIndicator.style = .large
        
        haveAnAccountButton.setTitle(R.string.localization.signUpHaveAnAccountButton(), for: .normal)
        haveAnAccountButton.setTitleColor(R.color.green_Global(), for: .normal)
    }
    
    private func setupConstraints() {
        backgroundFone.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(loginLabel.snp.top).offset(-65)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(stackView.snp.top).offset(-20)
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(signUpButton.snp.top).offset(-10)
        }
        stackView.snp.makeConstraints { make in
            make.left.equalTo(snp.left).offset(25)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(keepMeCheckBox.snp.top).offset(-16)
        }
        
        keepMeCheckBox.snp.makeConstraints { make in
            make.left.equalTo(snp.left).offset(25)
            make.bottom.equalTo(emailMeCheckBox.snp.top).offset(-8)
        }
        
        emailMeCheckBox.snp.makeConstraints { make in
            make.left.equalTo(snp.left).offset(25)
            make.bottom.equalTo(signUpButton.snp.top).offset(-48)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.bottom.equalTo(haveAnAccountButton.snp.top).offset(-20)
            make.centerX.equalToSuperview()
        }
        
        haveAnAccountButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}
