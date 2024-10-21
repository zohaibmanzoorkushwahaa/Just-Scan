//
//  LoginViewModel.swift
//  ScanCard
//
//  Created by Muhammad Irfan Zafar on 21/10/2024.
//

class LoginViewModel {
    
    weak var coordinator: LogisterCoordinator?
    
    init(coordinator: LogisterCoordinator) {
        self.coordinator = coordinator
    }
    
    @MainActor
    func performLogin() {
        let task = Task {
            do {
                //let result =  await Repo.login()
                coordinator?.loginSuccessfull()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
