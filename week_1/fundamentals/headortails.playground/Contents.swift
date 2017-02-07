//: Playground - noun: a place where people can play

import UIKit

//Create a function tossCoin() -> String
//Have this function print "Tossing a Coin!"
//Next have the function randomly pick either "Heads" or "Tails"
//Have the function print the result
//Finally, have the function return the result
//Now create another function tossMultipleCoins(Int) -> Double
//Have this function call the tossCoin function multiple times based on the Integer input
//Have the function return a Double that reflects the ratio of head toss to total toss


//Q1
func tossCoin() -> String {
    let coin: [String] = ["Heads", "Tails"]
    print("Tossing a coin!")
    return coin[Int(arc4random_uniform(UInt32(2)))]
}

//tossCoin()

//Q2
func tossMultipleCoins(someInt: Int) -> Double {
    var head: Double = 0
    for _ in 0...someInt{
        let toss = tossCoin()
        if  toss == "Heads"{
        head += 1
    }

}
    print(head/Double(someInt))
    return head/Double(someInt)
}
tossMultipleCoins(someInt: 10)