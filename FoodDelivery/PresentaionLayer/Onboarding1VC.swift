//
//  Onboarding1VC.swift
//  FoodDelivery
//
//  Created by MacBook on 12/01/2022.
//
import UIKit
import SnapKit

class Onboarding1VC: UIViewController {
    
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
        
        titleLabel.text = "Find your  Comfort\nFood here"
        titleLabel.font = .systemFont(ofSize: 22)
        titleLabel.textColor = UIColor(named: "text_black")
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        subtitleLabel.text = "Here You Can find a chef or dish for every\ntaste and color. Enjoy!"
        subtitleLabel.font = .systemFont(ofSize: 12)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = UIColor(named: "Green_Global")
        nextButton.layer.cornerRadius = 15

        logoImageView.image = UIImage(named: "logoImageOnbording1")
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
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.bottom.equalTo(titleLabel.snp.top).offset(-38)
        }
    }
}
