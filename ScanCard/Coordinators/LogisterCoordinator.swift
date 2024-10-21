//
//  LogisterCoordinator.swift
//  ScanCard
//
//  Created by Muhammad Irfan Zafar on 21/10/2024.
//

import UIKit

final class LogisterCoordinator: ChildCoordinator {

    var parent: RootCoordinator?
    var viewControllerRef: UIViewController?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let viewModel = LoginViewModel(coordinator: self)
        let loginVC = UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(identifier: "LoginVC") as! LoginVC
        loginVC.viewModel = viewModel
        viewControllerRef = loginVC
        navigationController.isNavigationBarHidden = true
        navigationController.customPushViewController(viewController: loginVC)
    }
    
    func loginSuccessfull() {
        coordinatorDidFinish()
        parent?.navigateToApp()
    }
    
    func coordinatorDidFinish() {
        if let viewController = viewControllerRef as? DisposableViewController {
            viewController.cleanUp()
        }
        parent?.childDidFinish(self)
    }
    
    
}
