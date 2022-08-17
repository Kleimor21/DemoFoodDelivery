//
//  SceneDelegate.swift
//  FoodDelivery
//
//  Created by MacBook on 12/01/2022.
//
import UIKit
import Moya

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

        func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
         
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    window?.rootViewController = createSignUpModele()
    window?.makeKeyAndVisible()
}
    private func createSignUpModele() -> UIViewController {

        let provider = MoyaProvider<AuthTarget>(plugins: [])
        let authService: AuthService = AuthServiceImpl(provider: provider)
        let viewModel = SignInViewModel(authService: authService)
        let viewController = SignInViewController(viewModel: viewModel)

        return  viewController
    }
}
