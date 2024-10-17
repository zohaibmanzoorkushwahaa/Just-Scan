//
//  ViewController.swift
//  ScanCard
//
//  Created by Muhammad Irfan Zafar on 10/10/2024.
//

import UIKit
import WeScan
import VisionKit

class ViewController: UIViewController {

    @IBAction func didScanTapped(_ sender: UIButton) {
        let scannerViewController = ImageScannerController(delegate: self)
        scannerViewController.modalPresentationStyle = .fullScreen
        scannerViewController.navigationBar.tintColor = .white
        present(scannerViewController, animated: true)
    }
    
    @IBAction func didScanWithAppleVision(_ sender: Any) {
        let scannerViewController = VNDocumentCameraViewController()
        scannerViewController.delegate = self
        present(scannerViewController, animated: true)
    }
    
    var viewModel: ViewControllerViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

extension ViewController: VNDocumentCameraViewControllerDelegate {
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        var selectedImage: UIImage?
        // Process the scanned pages
        for pageNumber in 0..<scan.pageCount {
            let image = scan.imageOfPage(at: pageNumber)
            selectedImage = image
        }

        // You are responsible for dismissing the controller.
        controller.dismiss(animated: true) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ViewImageVC") as! ViewImageVC
            vc.image = selectedImage
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: any Error) {
        controller.dismiss(animated: true)
    }
}
