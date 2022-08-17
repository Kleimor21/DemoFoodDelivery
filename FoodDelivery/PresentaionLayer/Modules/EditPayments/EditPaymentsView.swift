//
//  EditPaymentsView.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit
import SnapKit

class EditPaymentsView: UIView {
    
    let backgroundFone = UIImageView()
    let payBeckButton = UIButton()
    
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
        addSubview(backgroundFone)
        addSubview(payBeckButton)
        addSubview(collectionView)

        backgroundColor = .yellow
        
        collectionView.backgroundColor = .white
        collectionView.register(EditPaymentsCell.self, forCellWithReuseIdentifier: EditPaymentsCell.reuseId)
        
        backgroundFone.image = R.image.bagraundMain()
        payBeckButton.setImage(R.image.icon_Back(), for: .normal)
        
        let bottomInset = 20 + 74 + 10 + safeAreaInsets.bottom
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
    }
    
    private func setupConstraints() {
        backgroundFone.snp.makeConstraints { make in
                make.edges.equalToSuperview()
        }
        
        payBeckButton.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.top.equalTo(50)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(155)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(73))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        section.interGroupSpacing = 16
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        return UICollectionViewCompositionalLayout(section: section, configuration: config)
    }
}
