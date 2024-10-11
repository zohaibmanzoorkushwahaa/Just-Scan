//
//  ViewImageVC.swift
//  ScanCard
//
//  Created by Muhammad Irfan Zafar on 11/10/2024.
//

import UIKit

class ViewImageVC: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    var image: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        if let image = image {
            imgView.image = image
        }
    }

}
