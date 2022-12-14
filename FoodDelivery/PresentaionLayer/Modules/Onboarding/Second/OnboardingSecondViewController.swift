//
//  OnboardingSecondViewController.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit
import Combine

class OnboardingSecondViewController: UIViewController {
    
    let rootView = OnboardingSecondView()
    let viewModel: OnboardingSecondViewModel
    
    var cancellableSet = Set<AnyCancellable>()
    
    init(viewModel: OnboardingSecondViewModel) {
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
        rootView.nextButton.tapPublisher
            .subscribe(viewModel.nextEvent)
            .store(in: &cancellableSet)
    }
}
