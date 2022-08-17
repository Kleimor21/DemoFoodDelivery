//
//  HomeViewController.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<HomeSection, HomeMenu>
    
    private lazy var dataSorce: DataSource = createDataSource()
    private lazy var cellFactory = CellFactory(viewModel: viewModel)
    
    let rootView = HomeView()
    let viewModel: HomeViewModel
    
    var cancellableSet = Set<AnyCancellable>()
    
    init(viewModel: HomeViewModel) {
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
        
        viewModel.viewDidLoadEvent.send(())
    }
    
    private func setupBindings() {
        
        rootView.filterButton.tapPublisher
            .subscribe(viewModel.filterEvent)
            .store(in: &cancellableSet)
        
        rootView.logoutButton.tapPublisher
            .subscribe(viewModel.logoutEvent)
            .store(in: &cancellableSet)

        rootView.mapButton.tapPublisher
            .subscribe(viewModel.mapScrenEvent)
            .store(in: &cancellableSet)
        
        viewModel.$menus.sink { [weak self ] menus in
            self?.updateDataSourcs(menus: menus)
        }.store(in: &cancellableSet)
        
        rootView.notifiactionButton.isShowBadge = true
    }
    
    private func updateDataSourcs(menus: [HomeMenu]) {
        var snapshot = dataSorce.snapshot()
        
        snapshot.deleteAllItems()
        snapshot.appendSections([.popularMenu])
        snapshot.appendItems(menus)
        
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
