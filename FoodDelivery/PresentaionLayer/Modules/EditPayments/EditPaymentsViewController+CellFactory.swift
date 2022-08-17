//
//  EditPaymentsViewController+CellFactory.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Foundation
import UIKit

extension EditPaymentsViewController {
    
    final class CellFactory {
        
        private let viewModel: EditPaymentsViewModel
        
        init(viewModel: EditPaymentsViewModel) {
            self.viewModel = viewModel
        }
    
        func make(collectionView: UICollectionView, indexPath: IndexPath, item: PaymentTemplate) -> UICollectionViewCell {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EditPaymentsCell.reuseId, for: indexPath) as? EditPaymentsCell else {
               fatalError("Could not dequeue cell with identifier: \(EditPaymentsCell.reuseId)")
           }
            
            cell.configur(paymentTemplate: item)
            
            return cell
        }
    }
}
