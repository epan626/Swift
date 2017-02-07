//Write a program that adds the numbers 1-255 to an array
//Swap two random values in the array
//Hint: you can use the arc4random_uniform(UInt32) function to get a random number from 0 to the number passed in. The arc4random_uniform function takes in one parameter that is of the UInt32 type and returns a random number that is of the UInt32 type. How can you deal with this using your knowledge of types?
//Now write the code that swaps random values 100 times (You've created a "Shuffle"!)
//Remove the value "42" from the array and Print "We found the answer to the Ultimate Question of Life, the Universe, and Everything at index __" and print the index of where "42" was before you removed it.
//


import UIKit

//Q1
//var number: Int =  0
//var arr: [Int] = []
//
//while number < 256{
//    number += 1
//    arr.append(number)
//    print(arr)
//}

//Q2
//func swap(){
//    var number: Int =  0;
//    var arr: [Int] = []
//    var _temp: Int
//    
//    while number < 256{
//        number += 1
//        arr.append(number)
//    }
//    print(arr)
//    
//    let random: Int = Int(arc4random_uniform(UInt32(arr.count)))
//    print(random)
//    let random2: Int = Int(arc4random_uniform(UInt32(arr.count)))
//     print(random2)
//    _temp = arr[random]
//    arr[random-1] = arr[random2]
//    arr[random2-1] = _temp
//    print(arr)
//}
//
//swap()

//Q3
//func swap(){
//    var number: Int =  0
//    var arr: [Int] = []
//    var _temp: Int
//    
//    while number < 256{
//        number += 1
//        arr.append(number)
//    }
//    print(arr)
//    var count: Int = 0
//    while count < 101 {
//        let random: Int = Int(arc4random_uniform(UInt32(arr.count)))
//        print(random)
//        let random2: Int = Int(arc4random_uniform(UInt32(arr.count)))
//        print(random2)
//        _temp = arr[random]
//        arr[random-1] = arr[random2]
//        arr[random2-1] = _temp
//        count += 1
//    }
//    print(arr)
//    
//}
//
//swap()

//Q4
func swap(){
    var number: Int =  0
    var arr: [Int] = []
    var _temp: Int

    while number < 256{
        arr.append(number)
        number += 1
    }
    var count1: Int = 0
    print(arr)
    while count1 < 101 {
        let random: Int = Int(arc4random_uniform(UInt32(arr.count)))
        let random2: Int = Int(arc4random_uniform(UInt32(arr.count)))
        print(random)
        print(random2)
        _temp = arr[random]
        arr[random-1] = arr[random2]
        arr[random2-1] = _temp
        count1 += 1
    }
    print(arr)
    print("here")
    var i:Int = 0
    while arr[i]  != 42 {
       i += 1
    }
    if arr[i] == 42 {
        print(arr.count)
        print(i)
        print("We found the answer to the Ultimate Question of Life, the Universe and everything at index \(i)")
        arr.remove(at: i)
        print(arr.count)
    }
    else {
    print("42 is not here")
    print(arr.count)
    }
}

swap()


