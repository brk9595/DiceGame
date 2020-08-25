//
//  ViewController.swift
//  dicee
//
//  Created by Bharath  Raj kumar on 21/10/17.
//  Copyright © 2017 Bharath Raj Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rollCount: UILabel!
    @IBOutlet weak var diceText1: UILabel!
    @IBOutlet weak var diceText2: UILabel!
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    let viewModel = DiceViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.updateDice(state: .update)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func rollButtonPressed(_ sender: Any) {
        
        viewModel.updateDice(state: .update)
    }
    @IBAction func restbutton(_ sender: Any) {
        
        let buttonTapped = UIAlertController(title: "Reset", message: "Do you want to reset?", preferredStyle: .alert)
        
        let okAlertAction = UIAlertAction(title: "OK", style: .default) { [weak self] (_) in
            self?.viewModel.updateDice(state: .reset)
        }
        
        buttonTapped.addAction(okAlertAction)
        
        self.present(buttonTapped,animated: true, completion: nil)
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        viewModel.updateDice(state: .update)
    }
    
}

extension ViewController: DiceRollDelegate {
    
    func updateDiceImage(diceOne: Dice, diceTwo: Dice) {
        diceImageView1.image = diceOne.diceImage
        diceImageView2.image = diceTwo.diceImage
        
        diceText1.text = diceOne.diceName
        diceText2.text = diceTwo.diceName
    }
    
    func updateRoll(rollCount: Int) {
        self.rollCount.text = "\(rollCount)"
    }
}
