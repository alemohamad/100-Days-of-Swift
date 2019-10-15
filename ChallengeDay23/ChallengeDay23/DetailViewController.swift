//
//  DetailViewController.swift
//  ChallengeDay23
//
//  Created by Ale Mohamad on 15/10/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedFlag: String?
    var country: String?
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var countryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let flag = selectedFlag, let country = country {
            imageView.image = UIImage(named: flag)
            countryLabel.text = country
            title = country
        }
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    @objc func shareTapped() {
        guard let flagImage = imageView.image?.jpegData(compressionQuality: 0.8),
            let country = country else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [flagImage, country], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}
