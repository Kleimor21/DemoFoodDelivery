//
//  MainController.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit
import Combine

class MainController: UITabBarController {
    
    private let tabBarView = MainTabBarView()
    private var cancellableSet = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isHidden = true
        
        view.addSubview(tabBarView)
        
        tabBarView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(10)
        }
        
        tabBarView.selectadIndex = 0
        tabBarView.indexPublisher.sink { [weak self] index in
            self?.selectedIndex = index
        }.store(in: &cancellableSet)
    }
}
