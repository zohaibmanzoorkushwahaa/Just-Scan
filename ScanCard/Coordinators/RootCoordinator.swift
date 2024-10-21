//
//  RootCoordinator.swift
//  ScanCard
//
//  Created by Muhammad Irfan Zafar on 17/10/2024.
//

import Foundation
import UIKit

final class RootCoordinator: NSObject, ParentCoordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let viewModel = SplashViewModel(coordinator: self)
        let splashVC = SplashVC()
        splashVC.viewModel = viewModel
        navigationController.pushViewController(splashVC, animated: animated)
    }
    
}

extension RootCoordinator {
    
    func navigateFromSplashVC(isLoggedIn: Bool) {
        if isLoggedIn {
            navigateToApp()
        }else {
            navigateToLogister()
        }
    }
    
    func navigateToApp() {
        let viewModel = ViewControllerViewModel(coordinator: self)
        let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        homeVC.viewModel = viewModel
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    func navigateToLogister() {
        let logisterCoordinator = LogisterCoordinator(navigationController: navigationController)
        logisterCoordinator.parent = self
        addChildCoordinator(logisterCoordinator)
        logisterCoordinator.start(animated: true)
    }
}
