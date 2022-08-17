//
//  Ondoarding2VC.swift
//  FoodDelivery
//
//  Created by MacBook on 13/01/2022.

import UIKit
import SnapKit

class Ondoarding2VC: UIViewController {
    
    let logoImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(nextButton)
        
        titleLabel.text = "Food Ninja is Where Your\nComfort Food Lives"
        titleLabel.font = .boldSystemFont(ofSize: 22)
        titleLabel.textColor = UIColor(named: "text_black")
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        subtitleLabel.text = "Enjoy a fast and smooth food delivery at\nyour doorstep"
        subtitleLabel.font = .boldSystemFont(ofSize: 12)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = UIColor(named: "Green_Global")
        nextButton.layer.cornerRadius = 15
        
   
        logoImageView.image = UIImage(named: "logoImageOnbording2")
          
    }
    
    private func setupConstraints() {
        
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            make.width.equalTo(157)
            make.height.equalTo(57)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nextButton.snp.top).offset(-42)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(subtitleLabel.snp.top).offset(-20)
            make.centerX.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(47)
            make.bottom.equalTo(titleLabel.snp.top).offset(-59)
        }
    }
}
