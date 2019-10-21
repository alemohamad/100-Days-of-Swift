//
//  WebsitesTableViewController.swift
//  Project4
//
//  Created by Ale Mohamad on 21/10/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import UIKit

class WebsitesTableViewController: UITableViewController {
    
    let websites = ["apple.com", "hackingwithswift.com", "alemohamad.com", "android.com"]
    let allowedWebsites = ["apple.com", "hackingwithswift.com", "alemohamad.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Websites"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(websites[indexPath.row])
        let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)
        
        cell.textLabel?.text = websites[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "browser") as? ViewController {
            vc.website = websites[indexPath.row]
            vc.allowedWebsites = allowedWebsites
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
