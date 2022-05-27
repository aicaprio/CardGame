//
//  CardModel.swift
//  CardGame
//
//  Created by Franklin on 2022/5/26.
//

import Foundation
class CardModel{
    
    var indexOfOneAndOnlyFaceUpCard : Int?
    
    var cards = [Card]()
    
    func chooseCard(at index : Int){
        let choosedCard = cards[index]
        if !choosedCard.isMatched {
            // 只处理没匹配的部分
            if let lastFaceUpCardIndex = indexOfOneAndOnlyFaceUpCard , lastFaceUpCardIndex != index {
                // indexOfOneAndOnlyFaceUpCard有值，说明当前已经有一个卡片翻面了
                if cards[lastFaceUpCardIndex].identifier == choosedCard.identifier {
                    // 最新点击的卡片跟之前的卡片，刚好是同一图案.
                    cards[lastFaceUpCardIndex].isMatched = true
                    // 这种用法是错误的，因为Card是结构体，By Value.
                    // choosedCard.isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                // 归位
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                // 没有卡片翻面，也许是还没开始点击，也可能是刚刚翻过了两面后归位了
                for cardIndex in cards.indices {
                    cards[cardIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numbersOfPairsOfCards : Int){
        for _ in 0 ..< numbersOfPairsOfCards {
            let card = Card()
            cards += [card , card]
        }
    }
    
    // MARK:  Shuffle the cards.
}
