//
//  SignUpVC.swift
//  FoodDelivery
//
//  Created by MacBook on 20/01/2022.

import UIKit
import SnapKit

class SignUpVC: UIViewController {
  
    let backgroundFone = UIImageView()
    let logoImageView = UIImageView()
    
    let loginLabel = UILabel()
    let emailTF = TextInput(icon: UIImage(named: "icon_email"), isPassword: false)
    let passwordTF = TextInput(icon: UIImage(named: "icon_lock"), isPassword: true)
    let loginMethodLabel = UILabel()
    let loginViaFacebookButton = IconButton(icon: UIImage(named: "icon_facebook"), text: "Facebook")
    let loginViaGoogleButton = IconButton(icon: UIImage(named: "icon_google"), text: "Google")
    let forgotPasswordButton = UIButton(type: .system)
    let loginButton = GreenButton()
    let haveAnAccountButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(backgroundFone)
        view.addSubview(logoImageView)

        view.addSubview(loginLabel)
        view.addSubview(emailTF)
        view.addSubview(passwordTF)
        view.addSubview(loginMethodLabel)
        view.addSubview(loginViaFacebookButton)
        view.addSubview(loginViaGoogleButton)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(haveAnAccountButton)
    
        logoImageView.image = UIImage(named: "Logo")
        
        backgroundFone.image = UIImage(named: "background")
        
        loginLabel.text = "Login To Your Account"
        loginLabel.font = .boldSystemFont(ofSize: 20)
        loginLabel.numberOfLines = 0
        loginLabel.textAlignment = .center
        loginLabel.textColor = UIColor(named: "text_black")
        
        emailTF.textField.placeholder = "  Email"
        passwordTF.textField.placeholder = "  Password"
      
        loginMethodLabel.text = "Or Continue With"
        loginMethodLabel.font = .boldSystemFont(ofSize: 12)
        loginMethodLabel.numberOfLines = 0
        loginMethodLabel.textAlignment = .center
        loginMethodLabel.textColor = UIColor(named: "text_black")
        
        forgotPasswordButton.setTitle("Forgot Your Password?", for: .normal)
        forgotPasswordButton.tintColor = UIColor(named: "Green_Global")
      
        loginButton.setTitle("Login", for: .normal)
       
        haveAnAccountButton.setTitle("already have an account?", for: .normal)
        haveAnAccountButton.tintColor = UIColor(named: "Green_Global")
    }
    private func setupConstraints() {
        
        backgroundFone.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(40)
        }
        emailTF.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginLabel.snp.bottom).offset(30)
            make.width.equalTo(325)
        }
        passwordTF.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTF.snp.bottom).offset(12)
            make.width.equalTo(325)
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
        }
        forgotPasswordButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginViaGoogleButton.snp.bottom).offset(20)
        }
               loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(36)
        }
        haveAnAccountButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(18)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-12)
            
        }
    }
}
