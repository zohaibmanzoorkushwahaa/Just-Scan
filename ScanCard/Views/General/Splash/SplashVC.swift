//
//  SplashVC.swift
//  ScanCard
//
//  Created by Muhammad Irfan Zafar on 17/10/2024.
//

import UIKit

class SplashVC: UIViewController {
   
    @IBOutlet weak var lbl: UILabel!
    
    var viewModel: SplashViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 6)
        lbl.center.x += 300
        UIView.animate(withDuration: 2) {
            self.lbl.center.x -= 300
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {[weak self] in
            self?.viewModel.removeSplashScreen()
        })
    }
    
}
