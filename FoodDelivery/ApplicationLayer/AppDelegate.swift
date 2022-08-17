//
//  AppDelegate.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//
import UIKit
import Moya
import Combine
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private var applicationCoordinator: ApplicationCoordinator!
    private var cancellables = Set<AnyCancellable>()
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GMSServices.provideAPIKey("AIzaSyAeAX0xgJvNbm8dVvcUG8YW4O9hD9YjIA8")
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let coordinatorFactory = CoordinatorFactory()
        applicationCoordinator = ApplicationCoordinator(mainWindow: window,
                                                        coordinatorFactory: coordinatorFactory,
                                                        tokenManager: TokenManager.shered)
        
        applicationCoordinator.start().sink {}.store(in: &cancellables)
        
        return true
    }
}
