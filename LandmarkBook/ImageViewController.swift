//
//  ImageViewController.swift
//  LandmarkBook
//
//  Created by Ayub Ali on 2021-03-13.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var landmarkLabel: UILabel!
    @IBOutlet weak var uiImageView: UIImageView!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        landmarkLabel.text = selectedLandmarkName
        uiImageView.image = selectedLandmarkImage
    }
    

}
