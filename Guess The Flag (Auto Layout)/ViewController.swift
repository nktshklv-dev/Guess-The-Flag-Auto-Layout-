//
//  ViewController.swift
//  Guess The Flag (Auto Layout)
//
//  Created by Nikita  on 6/10/22.
//

import UIKit

class ViewController: UIViewController {
    var countries: [String] = []
    var correctAnswer = 0
    var score = 0
    var round = 0
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        
        button1.layer.borderWidth = 2
        button2.layer.borderWidth = 2
        button3.layer.borderWidth = 2
        
        button1.layer.borderColor = UIColor.systemGray.cgColor
        button2.layer.borderColor = UIColor.systemGray.cgColor
        button3
            .layer.borderColor = UIColor.systemGray.cgColor
        startGame()
        
        
        
    }
    
    func startGame(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = "Country: \(countries[correctAnswer].uppercased()) " + "| Score: \(score)"
    }
    
    func restartGame(_ action: UIAlertAction! = nil){
        score = 0
        round = 0
        startGame()
    }
    
    
    @IBAction func selectedCountry(_ sender: UIButton){
        if sender.tag == correctAnswer{
            score += 10
            round += 1
            startGame()
        }
        
        if round == 10{
            let ac = UIAlertController(title: "Good game!", message: "You've got \(score) points!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Start new game", style: .default, handler: restartGame))
            present(ac, animated: true, completion: nil)
        }
    }


}

