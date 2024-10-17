//
//  DisposableViewController.swift
//  ScanCard
//
//  Created by Muhammad Irfan Zafar on 17/10/2024.
//

import Foundation


/// All view controllers that perform tasks which should be cancelled once the view controller is dismissed should conform to this protocol.
protocol DisposableViewController: NSObjectProtocol {
    func cleanUp()
}
