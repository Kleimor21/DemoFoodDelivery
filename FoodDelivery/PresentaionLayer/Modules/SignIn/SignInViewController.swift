//
//  SignInViewController.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import UIKit
import Combine

class SignInViewController: UIViewController {
    
    let rootView = SignInView()
    let viewModel: SignInViewModel
    
    var cancellableSet = Set<AnyCancellable>()
    
    init(viewModel: SignInViewModel) {
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
        
        rootView.signInButton.tapPublisher
            .subscribe(viewModel.signInEvent)
            .store(in: &cancellableSet)
        
        rootView.signUpButton.tapPublisher
            .subscribe(viewModel.signUpEvent)
            .store(in: &cancellableSet)
        
        rootView.emailTF.textField.textPublisher
            .assign(to: \.email, on: viewModel)
            .store(in: &cancellableSet)
        
        rootView.passwordTF.textField.textPublisher
            .assign(to: \.password, on: viewModel)
            .store(in: &cancellableSet)
        
        viewModel.$isSignInButtonEnabled
            .assign(to: \.isEnabled, on: rootView.signInButton)
            .store(in: &cancellableSet)
    }
}
