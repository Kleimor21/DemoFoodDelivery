//
//  SignUpViewController.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.

import Combine
import UIKit

class CompletionRegistrationViewController: UIViewController {
    
    let viewModel: CompletionRegistrationViewModel
    let rootView = CompletionRegistrationView()
    
    var cancellableSet = Set<AnyCancellable>()
    
    init(viewModel: CompletionRegistrationViewModel) {
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
    }
    
    private func setupBindings() {
        rootView.tryOrderButton.tapPublisher
            .subscribe(viewModel.nextEvent)
            .store(in: &cancellableSet)
    }
}
