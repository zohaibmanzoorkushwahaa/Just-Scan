//
//  ViewController.swift
//  ScanCard
//
//  Created by Muhammad Irfan Zafar on 10/10/2024.
//

import UIKit
import WeScan

class ViewController: UIViewController {

    @IBAction func didScanTapped(_ sender: UIButton) {
        let scannerViewController = ImageScannerController(delegate: self)
        scannerViewController.modalPresentationStyle = .fullScreen
        
        scannerViewController.navigationBar.tintColor = .label
        
//        scannerViewController.navigationBar.tintColor = .black
        

        present(scannerViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: ImageScannerControllerDelegate {
    func imageScannerController(_ scanner: WeScan.ImageScannerController, didFinishScanningWithResults results: WeScan.ImageScannerResults) {
        
        scanner.dismiss(animated: true, completion: {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ViewImageVC") as! ViewImageVC
            vc.image = results.croppedScan.image
            self.navigationController?.pushViewController(vc, animated: true)
        })

    }
    
    func imageScannerControllerDidCancel(_ scanner: WeScan.ImageScannerController) {
        scanner.dismiss(animated: true, completion: nil)
    }
    
    func imageScannerController(_ scanner: WeScan.ImageScannerController, didFailWithError error: any Error) {
        assertionFailure("Error occurred: \(error)")
    }
    
    
}
