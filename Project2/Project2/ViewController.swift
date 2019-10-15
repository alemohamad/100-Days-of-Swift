//
//  ViewController.swift
//  Project2
//
//  Created by Ale Mohamad on 11/10/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var answersMade = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        askQuestion()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(showScoreTapped))
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) (SCORE: \(score))"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        
        if sender.tag == correctAnswer {
            title = "Correct!"
            score += 1
            message = "Your score is \(score)"
        } else {
            title = "Wrong!"
            score -= 1
            message = "That’s the flag of \(countries[sender.tag].uppercased())"
        }
        
        answersMade += 1
        
        if answersMade == 10 {
            let ac = UIAlertController(title: "Thanks for playing!", message: "Your final score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Start again", style: .default, handler: askQuestion))
            present(ac, animated: true)
            
            score = 0
            answersMade = 0
        } else {
            let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
    }
    
    @objc func showScoreTapped() {
        let ac = UIAlertController(title: "Guess the flag!", message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
}

