import UIKit

class Animal {
    var name = String()
    var health:Int = 100
    init(name: String){
        self.name = name
    }
    func displayHealth()->Int{
        print(health)
        return health
    }
}

class Cat: Animal{
    func grow() {
        print("Rawr!")
    }
    func run() -> Int{
        if health > 0{
        health -= 10
        print("Running")
        return health
        } else{
            return health
        }
    }
    override init(name: String){
        super.init(name: name)
        self.health = 150
    }
    
}


var kitty = Cat(name: "ERIC")
kitty.displayHealth()

//kitty.grow()
//kitty.run()
//kitty.run()
//kitty.run()




class Lion: Cat{
    override func grow() {
        print("ROAR!!!!")
    }
      override init(name: String){
        super.init(name: name)
        self.health = 200
    }
}

var sinba = Lion(name: "sinba")
//
//sinba.grow()
//sinba.run()


class Cheetah: Cat{
    override func run() -> Int{
        if health > 0 {
        health -= 50
        print("Running Fast")
        return health
        } else {
            return health
        }
    }
    func sleep() -> Int{
        if health == 200 {
            return health
        } else {
            health += 50
            return health
        }
    }
    override init(name: String){
        super.init(name: name)
        self.health = 200
    }
}

var chee = Cheetah(name: "chee")

chee.run()
chee.run()
chee.run()
chee.run()
chee.run()




