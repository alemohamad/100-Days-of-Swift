//
//  ViewController.swift
//  ChallengeDay23
//
//  Created by Ale Mohamad on 15/10/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import UIKit

class FlagsViewController: UITableViewController {
    
    var flags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flag Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("flag_") {
                flags.append(item)
            }
        }
        
        flags = flags.sorted()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let flagFileName = flags[indexPath.row]
        cell.textLabel?.text = getCountryName(byFlag: flagFileName)
        cell.imageView?.image = UIImage(named: flagFileName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "detail") as? DetailViewController {
            let flagFileName = flags[indexPath.row]
            vc.selectedFlag = flagFileName
            vc.country = getCountryName(byFlag: flagFileName)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func getCountryName(byFlag flag: String?) -> String {
        let minusFirst = String(flag?.dropFirst("flag_".count) ?? "Unknown")
        let minusLast = String(minusFirst.dropLast(".png".count))
        return minusLast.uppercased()
    }
    
}

