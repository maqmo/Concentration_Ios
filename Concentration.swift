//
//  File.swift
//  Concentration 00
//
//  Created by Mohamed Albgal on 9/2/19.
//  Copyright © 2019 Mohamed Albgal. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true;
                    cards[index].isMatched = true;
                }
                cards[index].isFaceUp = true;
                indexOfOneAndOnlyFaceUpCard = nil;
            }else{
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    init(numberOfCardPairs: Int){
        for _ in 1...numberOfCardPairs {
            let card = Card()
            cards += [card, card]
        }
        shuffleCards()
    }
    func shuffleCards(){
        var randoms = Set(0...cards.count - 1)i
        for i in cards.indices {
            let rand = randoms.popFirst()!
            cards.swapAt(rand, i)
        }
    }
}
