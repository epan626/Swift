import UIKit

struct Card {
    var value = String()
    var numerical_value = Int()
    var suit = String()
}

var face:[String] = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
var vals:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13]
var suit:[String] = ["Clubs", "Spades", "Hearts", "Diamonds"]

class Deck{
    var cards = [Card]()
    var number: Int =  0
    var arr: [Int] = []
    var _temp: Card?
    init() {
        for x in suit {
            for i in 0..<face.count {
                let card = Card(value: face[i], numerical_value: vals[i], suit: x)
                cards.append(card)
            }
        }
    }
    
    func deal() -> Card {
        return cards.removeFirst()
    }
    func reset() -> Deck {
        return Deck()
    }
    func shuffle() -> [Card] {
        var count1: Int = 0
        while count1 < 101 {
            let random: Int = Int(arc4random_uniform(UInt32(cards.count-1)))
            let random2: Int = Int(arc4random_uniform(UInt32(cards.count-1)))
//            print(random)
            _temp = cards[random]
            cards[random] = cards[random2]
            cards[random2] = _temp!
            count1 += 1
            }
        print(cards)
        return cards
        }
    }

class Player{
    var name = String()
    var hand = [Card]()
    init(name: String){
        self.name = name
    }
    func draw(deck: Deck) -> Card {
        let solocard = deck.deal()
        hand.append(solocard)
        print(hand)
        return solocard
    }
    func discard(card: Card) -> Bool {
        for x in 0..<hand.count{
            if card.value == hand[x].value && card.suit == hand[x].suit {
                hand.remove(at: x)
                return true
            }
        }
        return false
    }
    
}

var x = Deck()

var Eric: Player = Player(name: "Eric")

x.cards
x.shuffle()
print("bottom")
let one: Card = Eric.draw(deck: x)
Eric.draw(deck: x)
Eric.draw(deck: x)
Eric.draw(deck: x)
Eric.draw(deck: x)
Eric.discard(card: one)
