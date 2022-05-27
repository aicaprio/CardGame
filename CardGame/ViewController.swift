//
//  ViewController.swift
//  CardGame
//
//  Created by Franklin on 2022/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    lazy var game = CardModel(numbersOfPairsOfCards: (cardButtons.count + 1)/2)
    
    var emojArray = ["🦄","🦋","🦕","🐋","🐻‍❄️","🐱","🐹","🙊","🐣"]
    
    var emojDict = [Int:String]()
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    
    @IBAction func touchCard(_ sender: UIButton) {
        if let buttonIndex = cardButtons.firstIndex(of: sender){
            print("button index \(buttonIndex)")
            flipCount += 1
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }else{
            print("button not in the array")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if(card.isFaceUp){
                button.setTitle(emoj(for: card), for: .normal)
                button.backgroundColor = .white
            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = .orange
            }
            if(card.isMatched){
                button.setTitle("", for: .normal)
                button.backgroundColor = .clear
                button.isEnabled = false
            }
        }
    }
    
   
    func emoj(for card : Card) -> String{
        if emojDict[card.identifier] == nil , emojArray.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojArray.count)))
            emojDict[card.identifier] = emojArray.remove(at: randomIndex)
        }
        return emojDict[card.identifier] ?? "?"
    }
    
}

