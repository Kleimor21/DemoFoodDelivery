//
//  SignUpViewController.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Combine
import UIKit

class SignUpViewController: UIViewController {
    
    let viewModel: SignUpViewModel
    let rootView = SignUpView()
    
    var cancellableSet = Set<AnyCancellable>()
    
    init(viewModel: SignUpViewModel) {
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
        rootView.signUpButton.tapPublisher
            .subscribe(viewModel.signUpEvent)
            .store(in: &cancellableSet)
        
        rootView.haveAnAccountButton.tapPublisher
            .subscribe(viewModel.signInEvent)
            .store(in: &cancellableSet)

        rootView.emailTF.textField.textPublisher
            .assign(to: \.email, on: viewModel)
            .store(in: &cancellableSet)
        
        viewModel.$isLoadingSignUp.sink { [weak self] isLoading in
            if isLoading {
                self?.rootView.activityIndicator.startAnimating()
            } else {
                self?.rootView.activityIndicator.stopAnimating()
            }
        }.store(in: &cancellableSet)
        
        rootView.passwordTF.textField.textPublisher
            .assign(to: \.password, on: viewModel)
            .store(in: &cancellableSet)
        
        viewModel.$isSignUpButtonEnabled
            .assign(to: \.isEnabled, on: rootView.signUpButton)
            .store(in: &cancellableSet)
    }
}
