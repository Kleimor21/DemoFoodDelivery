//
//  HomeView.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    let backgroundFone = UIImageView()
    let titleLabel = UILabel()
    let logoutButton = UIButton()
    let searchTextInput = SearchInput()
    let filterButton = FilterButton()
    let popularMenu = UILabel()
    let mapButton = UIButton()
    var notifiactionButton = NotificationButton()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionViewLayout())
    
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
        addSubview(titleLabel)
        addSubview(logoutButton)
        addSubview(searchTextInput)
        addSubview(filterButton)
        addSubview(collectionView)
        addSubview(popularMenu)
        addSubview(notifiactionButton)
        addSubview(mapButton)

        backgroundFone.image = R.image.bagraundMain()
        
        popularMenu.text = R.string.localization.homeViewPopularMenu()
        popularMenu.font = .boldSystemFont(ofSize: 31)
        popularMenu.textColor = R.color.text_black()
        popularMenu.numberOfLines = 0
        popularMenu.textAlignment = .left
        
        titleLabel.text = R.string.localization.homeTitle()
        titleLabel.font = .boldSystemFont(ofSize: 31)
        titleLabel.textColor = R.color.text_black()
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        
        logoutButton.setTitle(R.string.localization.homeViewLogoutButton(), for: .normal)
        logoutButton.setImage(R.image.icon_lock(), for: .normal)

        mapButton.setImage(R.image.icon_map(), for: .normal)
        
        notifiactionButton.layer.shadowColor = R.color.shadow_Color_notification()?.cgColor
        notifiactionButton.layer.shadowRadius = 50
        notifiactionButton.layer.shadowOpacity = 0.2
        notifiactionButton.layer.shadowOffset = CGSize(width: 11, height: 28)
        
        collectionView.backgroundColor = .white
        collectionView.register(HomeMenuCell.self, forCellWithReuseIdentifier: HomeMenuCell.reuseId)
        let bottomInset = 20 + 74 + 10 + safeAreaInsets.bottom
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
    }
    
    private func setupConstraints() {
        backgroundFone.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.left.equalTo(snp.left).offset(31)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(snp.left).offset(31)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.right).offset(5)
            make.top.equalTo(titleLabel.snp.top).offset(5)
        }
        
        searchTextInput.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(25)
            make.right.equalTo(filterButton.snp.left).inset(-9)
            make.top.equalTo(titleLabel.snp.bottom).offset(18)
        }
        
        filterButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchTextInput.snp.centerY)
            make.right.equalToSuperview().inset(25)
        }
        
        popularMenu.snp.makeConstraints { make in
            make.top.equalTo(searchTextInput.snp.bottom).offset(20)
            make.left.equalTo(snp.left).offset(20)
        }
        
        mapButton.snp.makeConstraints { make in
            make.top.equalTo(filterButton.snp.bottom).inset(-10)
            make.left.equalTo(filterButton.snp.left)
            make.size.equalTo(50)
        }
        
        notifiactionButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(41)
            make.right.equalToSuperview().inset(39)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(popularMenu.snp.bottom).offset(20)
            make.left.right.bottom.equalToSuperview()
            
        }
    }
        
        private func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(87))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitem: item, count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
            section.interGroupSpacing = 20
            
            let config = UICollectionViewCompositionalLayoutConfiguration()
            return UICollectionViewCompositionalLayout(section: section, configuration: config)
        }
    }
