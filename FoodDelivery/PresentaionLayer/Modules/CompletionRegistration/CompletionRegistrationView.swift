//
//  Onboarding1VC.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit
import SnapKit

class CompletionRegistrationView: UIView {
    
    let backgroundFone = UIImageView()
    let logoImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let tryOrderButton = GreenButton()
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
        backgroundColor = .white
        addSubview(backgroundFone)
        addSubview(logoImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(tryOrderButton)
        addSubview(activityIndicator)
        
        logoImageView.image = R.image.checkMark()
        
        backgroundFone.image = R.image.background()
        
        titleLabel.text = R.string.localization.completionRegistrationTitle()
        titleLabel.font = .boldSystemFont(ofSize: 30)
        titleLabel.textColor = R.color.text_black()
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = R.color.green_Global()
        
        subtitleLabel.text = "Your Profile Is Ready To Use"
        subtitleLabel.text = R.string.localization.completionRegistrationSubtitle()
        subtitleLabel.font = .boldSystemFont(ofSize: 23)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
        
        tryOrderButton.setTitle("Try Order", for: .normal)
        tryOrderButton.setTitle(R.string.localization.completionRegistrationTryOrderButton(), for: .normal)
        tryOrderButton.backgroundColor = R.color.green_Global()
        tryOrderButton.layer.cornerRadius = 15
    }
    
    private func setupConstraints() {
        backgroundFone.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tryOrderButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-30)
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
            make.bottom.equalTo(titleLabel.snp.top).offset(-35)
            make.left.right.equalToSuperview().inset(101)
        }
    }
}
