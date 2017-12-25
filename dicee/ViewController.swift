//
//  ViewController.swift
//  dicee
//
//  Created by Bharath  Raj kumar on 21/10/17.
//  Copyright © 2017 Bharath Raj Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomDiceIndex1 : Int =  0
    var randomDiceIndex2 : Int =  0
    let diceArray = ["dice1","dice2","dice3","dice4","dice5","dice6" ]
    
    @IBOutlet weak var rollCount: UILabel!
    @IBOutlet weak var diceText1: UILabel!
    @IBOutlet weak var diceText2: UILabel!
    let textArray = ["One","Two","Three","Four","Five","Six"]
    private var rollCount1 = 0
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateDiceImage()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollButtonPressed(_ sender: Any) {
        
        updateDiceImage()
        
        
        rollCount1 = rollCount1 + 1
        rollCount.text = "\(rollCount1)"
        }
    @IBAction func restbutton(_ sender: Any) {
        randomDiceIndex1 = 0
        randomDiceIndex2 = 0
        rollCount1 = 0
        
        rollCount.text = "\(rollCount1)"
        diceText1.text = textArray[0]
        diceText2.text = textArray[0]
        
        let buttonTapped = UIAlertController(title: "Reset", message: "Do you want to reset?", preferredStyle: .alert)
        buttonTapped.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
        
        self.present(buttonTapped,animated: true, completion: nil)
    }
    
    func updateDiceImage() {
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        
        diceText1.text = textArray[randomDiceIndex1]
        diceText2.text = textArray[randomDiceIndex2]
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateDiceImage()
    }
    
}

