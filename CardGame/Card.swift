//
//  Card.swift
//  CardGame
//
//  Created by Franklin on 2022/5/26.
//

import Foundation
struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier : Int
    
    static var identifierFactory = 0
    
    static func getIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        identifier = Card.getIdentifier()
    }
    
}
