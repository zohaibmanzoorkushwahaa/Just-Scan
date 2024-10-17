//
//  SplashViewModel.swift
//  ScanCard
//
//  Created by Muhammad Irfan Zafar on 17/10/2024.
//

import Foundation

class SplashViewModel {
    
    //MARK: - Variables
    var coordinator: RootCoordinator
    
    //MARK: - init
    init(coordinator: RootCoordinator) {
        self.coordinator = coordinator
    }
    
    func isUserConnected() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    //MARK: - Navigation
    
    func removeSplashScreen() {
        coordinator.navigateFromSplashVC(isLoggedIn: true)
    }
}
