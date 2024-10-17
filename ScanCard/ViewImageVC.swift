//
//  ViewImageVC.swift
//  ScanCard
//
//  Created by Muhammad Irfan Zafar on 11/10/2024.
//

import UIKit

enum FilterType : String {
    case Chrome = "CIPhotoEffectChrome"
    case Fade = "CIPhotoEffectFade"
    case Instant = "CIPhotoEffectInstant"
    case Mono = "CIPhotoEffectMono"
    case Noir = "CIPhotoEffectNoir"
    case Process = "CIPhotoEffectProcess"
    case Tonal = "CIPhotoEffectTonal"
    case Transfer =  "CIPhotoEffectTransfer"
}

extension UIImage {
    func addFilter(filter : FilterType) -> UIImage {
        let filter = CIFilter(name: filter.rawValue)
        // convert UIImage to CIImage and set as input
        let ciInput = CIImage(image: self)
        filter?.setValue(ciInput, forKey: "inputImage")
        // get output CIImage, render as CGImage first to retain proper UIImage scale
        let ciOutput = filter?.outputImage
        let ciContext = CIContext()
        let cgImage = ciContext.createCGImage(ciOutput!, from: (ciOutput?.extent)!)
        //Return the image
        return UIImage(cgImage: cgImage!)
    }
}

class ViewImageVC: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var filteredImageView: UIImageView!
    @IBOutlet weak var imgViewContrast: UIImageView!
    
    var image: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupUI()
    }
    
    private func setupUI() {
           if let image = image {
               // Show a placeholder image
               filteredImageView.image = UIImage(named: "placeholder")
               imgViewContrast.image = UIImage(named: "placeholder")
               imgView.image = image
               
               // Perform filtering on a background thread
               DispatchQueue.global(qos: .userInitiated).async {
                   let filteredImage = self.increaseContrast(image)

                   // Update UI on the main thread
                   DispatchQueue.main.async {
                       self.filteredImageView.image = filteredImage
                       self.imgViewContrast.image = filteredImage
                   }
               }
           }
       }
    
    func increaseContrast(_ image: UIImage) -> UIImage {
        let inputImage = CIImage(image: image)!
        let parameters = [
            "inputContrast": NSNumber(value: 2)
        ]
        let outputImage = inputImage.applyingFilter("CIColorControls", parameters: parameters)

        let context = CIContext(options: nil)
        let img = context.createCGImage(outputImage, from: outputImage.extent)!
        return UIImage(cgImage: img)
    }

}
