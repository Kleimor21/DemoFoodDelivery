//
//  HomeViewController+CellFactory.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Foundation
import UIKit

extension HomeViewController {
    
    final class CellFactory {
        
        private let viewModel: HomeViewModel
        
        init(viewModel: HomeViewModel) {
            self.viewModel = viewModel
        }
          
        func make(collectionView: UICollectionView, indexPath: IndexPath, item: HomeMenu) -> UICollectionViewCell {
            
           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMenuCell.reuseId, for: indexPath) as? HomeMenuCell else {
               fatalError("Could not dequeue cell with identifier: \(HomeMenuCell.reuseId)")
           } 
            
            cell.configur(menu: item)
            
            return cell
        }
    }
}
