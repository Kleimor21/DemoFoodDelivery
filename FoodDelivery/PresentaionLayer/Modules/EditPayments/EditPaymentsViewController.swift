//
//  EditPaymentsViewController.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit
import Combine

class EditPaymentsViewController: UIViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<EditPaymentsSection, PaymentTemplate>
    private lazy var dataSorce: DataSource = createDataSource()
    private lazy var cellFactory = CellFactory(viewModel: viewModel)
    
    let rootView = EditPaymentsView()
    let viewModel: EditPaymentsViewModel
    
    var cancellableSet = Set<AnyCancellable>()

    init(viewModel: EditPaymentsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        viewModel.viewPaymentDidLoadEvent.send(())
    }
    
    private func setupBindings() {
        rootView.payBeckButton.tapPublisher
            .subscribe(viewModel.payBackEvent)
            .store(in: &cancellableSet)
        
        viewModel.$template.sink { [weak self ] template in
            self?.updateDataSourcs(template: template)
        }.store(in: &cancellableSet)
    }
    
    private func updateDataSourcs(template: [PaymentTemplate]) {
        var snapshot = dataSorce.snapshot()
        snapshot.deleteAllItems()
        snapshot.appendSections([.payment])
        snapshot.appendItems(template)
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self ] in
            self?.dataSorce.apply(snapshot, animatingDifferences: true, completion: nil)
        }
    }
    
    private func createDataSource() -> DataSource {
        
        let dataSource = DataSource(collectionView: rootView.collectionView) { [weak self ] collectionView, indexPath, item in
            return self?.cellFactory.make(collectionView: collectionView, indexPath: indexPath, item: item)
        }
        return dataSource
    }
}
