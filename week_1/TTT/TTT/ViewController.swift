//
//  ViewController.swift
//  TTT
//
//  Created by Eric Pan on 2/7/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var player = true
    var win = [0,0,0,0,0,0,0,0]
    var picked = [UIButton]()
    var flag = false
    var gameover = false
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBAction func titlePressed(_ sender: UIButton) {
        flag = false
        winnerLabel.isHidden = true
        if sender.tag == 9 {
            for x in picked {
                x.backgroundColor = UIColor.lightGray
            }
            picked = [UIButton]()
            winnerLabel.text = "New Game"
            winnerLabel.isHidden = false
            win = [0,0,0,0,0,0,0,0]
            gameover = false
        }
        for i in picked {
            if i.tag == sender.tag {
                flag = true
                winnerLabel.text = "HEY stop it"
                winnerLabel.isHidden = false
            }
        }
            if flag == false && gameover == false {
                if player == true {
                    if sender.tag != 9{
                        sender.backgroundColor = UIColor.green
                        player = false
                    }
                    if sender.tag == 0 {
                        win[0] += 1
                        win[3] += 1
                        win[7] += 1
                        picked.append(sender)
                    }
                    if sender.tag == 1 {
                        win[1] += 1
                        win[3] += 1
                        picked.append(sender)
                    }
                    if sender.tag == 2 {
                        win[2] += 1
                        win[3] += 1
                        win[6] += 1
                        picked.append(sender)
                    }
                    if sender.tag == 3 {
                        win[0] += 1
                        win[4] += 1
                        picked.append(sender)
                    }
                    if sender.tag == 4 {
                        win[1] += 1
                        win[4] += 1
                        win[6] += 1
                        win[7] += 1
                        picked.append(sender)
                    }
                    if sender.tag == 5 {
                        win[2] += 1
                        win[4] += 1
                        picked.append(sender)
                    }
                    if sender.tag == 6 {
                        win[0] += 1
                        win[5] += 1
                        win[6] += 1
                        picked.append(sender)
                    }
                    if sender.tag == 7 {
                        win[1] += 1
                        win[5] += 1
                        picked.append(sender)
                    }
                    if sender.tag == 8 {
                        win[2] += 1
                        win[5] += 1
                        win[7] += 1
                        picked.append(sender)
                    }
                    
                } else {
                    if sender.tag != 9 {
                        sender.backgroundColor = UIColor.red
                        player = true
                    }
                    if sender.tag == 0 {
                        win[0] -= 1
                        win[3] -= 1
                        win[7] -= 1
                        picked.append(sender)
                    }
                    if sender.tag == 1 {
                        win[1] -= 1
                        win[3] -= 1
                        picked.append(sender)
                    }
                    if sender.tag == 2 {
                        win[2] -= 1
                        win[3] -= 1
                        win[6] -= 1
                        picked.append(sender)
                    }
                    if sender.tag == 3 {
                        win[0] -= 1
                        win[4] -= 1
                        picked.append(sender)
                    }
                    if sender.tag == 4 {
                        win[1] -= 1
                        win[4] -= 1
                        win[6] -= 1
                        win[7] -= 1
                        picked.append(sender)
                    }
                    if sender.tag == 5 {
                        win[2] -= 1
                        win[4] -= 1
                        picked.append(sender)
                    }
                    if sender.tag == 6 {
                        win[0] -= 1
                        win[5] -= 1
                        win[6] -= 1
                        picked.append(sender)
                    }
                    if sender.tag == 7 {
                        win[1] -= 1
                        win[5] -= 1
                        picked.append(sender)
                    }
                    if sender.tag == 8 {
                        win[2] -= 1
                        win[5] -= 1
                        win[7] -= 1
                        picked.append(sender)
                    }
                    
                }
            }
        for x in win {
            print(x)
            if x == 3 {
                winnerLabel.text = "Player 1 wins"
                winnerLabel.isHidden = false
                gameover = true
            } else if x == -3 {
                
                winnerLabel.text = "Player 2 wins"
                winnerLabel.isHidden = false
                gameover = true
            }
        }

        }
//    else {
//                winnerLabel.text = "Please pick another square"
//                winnerLabel.isHidden = false
//            }

 
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

