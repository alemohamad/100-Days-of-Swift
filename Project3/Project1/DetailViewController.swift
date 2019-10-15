//
//  DetailViewController.swift
//  Project1
//
//  Created by Ale Mohamad on 09/10/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var selectedIndex = 0
    var totalImages = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture \(selectedIndex) of \(totalImages)"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8),
            let name = selectedImage else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, name], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}
