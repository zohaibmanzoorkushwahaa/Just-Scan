//
//  ViewControllerViewModell.swift
//  ScanCard
//
//  Created by Muhammad Irfan Zafar on 17/10/2024.
//


class ViewControllerViewModel {
    
    weak var coordinator: RootCoordinator?
    
    init(coordinator: RootCoordinator) {
        self.coordinator = coordinator
    }
}
