//
//  ViewModel.swift
//  dicee
//
//  Created by Bharath  Raj kumar on 25/08/20.
//  Copyright © 2020 Bharath Raj Kumar. All rights reserved.
//

import Foundation
import UIKit



protocol DiceRollDelegate: class {
    func updateDiceImage(diceOne: Dice, diceTwo: Dice)
    func updateRoll(rollCount: Int)
}

enum GameState {
    case update
    case reset
}

class DiceViewModel {
    let diceArray = ["dice1","dice2","dice3","dice4","dice5","dice6" ]
    let textArray = ["One","Two","Three","Four","Five","Six"]
    
    var rollCount = 0
    
    weak var delegate: DiceRollDelegate?
    
    func updateDice(state: GameState) {
        switch state {
            case .reset:
                self.reset()
            case .update:
                self.getRandomDices()
        }
    }
    
    private func getRandomDices() {
        let diceOne = Int(arc4random_uniform(6))
        let diceTwo = Int(arc4random_uniform(6))

        updateRoll(currentRollCount: rollCount, state: .update)
        
        let dice = makeDiceObj(diceOne: diceOne, diceTwo: diceTwo)
        guard let diceOneObj = dice.0 else {return}
        guard let diceTwoObj = dice.1 else {return}
        
        delegate?.updateDiceImage(diceOne: diceOneObj , diceTwo: diceTwoObj)
    }
    
    
    private func reset() {
        
        updateRoll(currentRollCount: self.rollCount, state: .reset)
        let dice = makeDiceObj(diceOne: 0, diceTwo: 0)
        
        guard let diceOneObj = dice.0 else {return}
        guard let diceTwoObj = dice.1 else {return}
        
        delegate?.updateDiceImage(diceOne: diceOneObj , diceTwo: diceTwoObj)
    }
    
    private func makeDiceObj(diceOne: Int, diceTwo: Int) -> (Dice?,Dice?) {
        guard let diceOneImage = UIImage(named: diceArray[diceOne]) else {return (nil,nil)}
        guard let diceImageTwo = UIImage(named: diceArray[diceTwo]) else {return (nil,nil)}
        
        let diceOneObj = Dice(diceImage: diceOneImage, diceName: textArray[diceOne])
        let diceTwoObj = Dice(diceImage: diceImageTwo, diceName: textArray[diceTwo])
        
        return (diceOneObj,diceTwoObj)
    }
    
    func updateRoll(currentRollCount: Int, state: GameState) {
        switch state {
            case .reset:
                self.rollCount = 0
                delegate?.updateRoll(rollCount: 0)
            case .update:
                rollCount += 1
                delegate?.updateRoll(rollCount: rollCount + 1)
        }
        
    }
    
}
