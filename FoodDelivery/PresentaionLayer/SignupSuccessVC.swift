//
//  Onboarding1VC.swift
//  FoodDelivery
//
//  Created by MacBook on 12/01/2022.
//

import UIKit
import SnapKit

class SignupSuccessVC: UIViewController {
  
    let backgroundFone = UIImageView()
    let logoImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let tryOrderButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(backgroundFone)
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(tryOrderButton)
        
        logoImageView.image = UIImage(named: "CheckMark")
        
        backgroundFone.image = UIImage(named: "background")
        
        titleLabel.text = "Congrats!"
        titleLabel.font = .boldSystemFont(ofSize: 30)
        titleLabel.textColor = UIColor(named: "text_black")
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor(named: "Green_Global")
        
        subtitleLabel.text = "Your Profile Is Ready To Use"
        subtitleLabel.font = .boldSystemFont(ofSize: 23)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
        
        tryOrderButton.setTitle("Try Order", for: .normal)
        tryOrderButton.backgroundColor = UIColor(named: "Green_Global")
        tryOrderButton.layer.cornerRadius = 15
    }
    
    private func setupConstraints() {
        
        backgroundFone.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tryOrderButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            make.width.equalTo(157)
            make.height.equalTo(57)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(tryOrderButton.snp.top).offset(-192)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(subtitleLabel.snp.top).offset(-12)
            make.centerX.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top).offset(-33)
            make.left.right.equalToSuperview().inset(101)
        }
    }
}
