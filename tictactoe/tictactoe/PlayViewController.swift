//
//  PlayViewController.swift
//  tictactoe
//
//  Created by Andrew Carvajal on 9/10/18.
//  Copyright © 2018 Tendigi. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    var tenthPoint = Color.black
    
    var ninthPointA = Color.black
    var eighthPointA = Color.black
    var seventhPointA = Color.black
    var sixthPointA = Color.black
    var fifthPointA = Color.black
    var fourthPointA = Color.black
    var thirdPointA = Color.black
    var secondPointA = Color.black
    var firstPointA = Color.black
    
    var ninthPointB = Color.black
    var eighthPointB = Color.black
    var seventhPointB = Color.black
    var sixthPointB = Color.black
    var fifthPointB = Color.black
    var fourthPointB = Color.black
    var thirdPointB = Color.black
    var secondPointB = Color.black
    var firstPointB = Color.black

    var firstSquareRow1 = [Color.black, Color.black, Color.black]
    var firstSquareRow2 = [Color.black, Color.black, Color.black]
    var firstSquareRow3 = [Color.black, Color.black, Color.black]

    var secondSquareRow1 = [Color.black, Color.black, Color.black]
    var secondSquareRow2 = [Color.black, Color.black, Color.black]
    var secondSquareRow3 = [Color.black, Color.black, Color.black]

    var thirdSquareRow1 = [Color.black, Color.black, Color.black]
    var thirdSquareRow2 = [Color.black, Color.black, Color.black]
    var thirdSquareRow3 = [Color.black, Color.black, Color.black]

    var fourthSquareRow1 = [Color.black, Color.black, Color.black]
    var fourthSquareRow2 = [Color.black, Color.black, Color.black]
    var fourthSquareRow3 = [Color.black, Color.black, Color.black]

    var fifthSquareRow1 = [Color.black, Color.black, Color.black]
    var fifthSquareRow2 = [Color.black, Color.black, Color.black]
    var fifthSquareRow3 = [Color.black, Color.black, Color.black]

    var sixthSquareRow1 = [Color.black, Color.black, Color.black]
    var sixthSquareRow2 = [Color.black, Color.black, Color.black]
    var sixthSquareRow3 = [Color.black, Color.black, Color.black]

    var seventhSquareRow1 = [Color.black, Color.black, Color.black]
    var seventhSquareRow2 = [Color.black, Color.black, Color.black]
    var seventhSquareRow3 = [Color.black, Color.black, Color.black]

    var eighthSquareRow1 = [Color.black, Color.black, Color.black]
    var eighthSquareRow2 = [Color.black, Color.black, Color.black]
    var eighthSquareRow3 = [Color.black, Color.black, Color.black]

    var ninthSquareRow1 = [Color.black, Color.black, Color.black]
    var ninthSquareRow2 = [Color.black, Color.black, Color.black]
    var ninthSquareRow3 = [Color.black, Color.black, Color.black]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(updateSquares), name: NSNotification.Name(rawValue: "CurrentGameUpdated"), object: nil)
        Network.shared.updateCurrentGameListenerAndSingleton {
            self.updateSquares()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func updateSquares() {
        guard let color = Network.shared.thisPersonsColor else { return }

        for (square, played) in Network.shared.currentGame {
            switch square {
            case "square1":
                switch played {
                case "x":
                    firstSquareRow1 = [color, Color.black, color]
                    firstSquareRow2 = [Color.black, color, Color.black]
                    firstSquareRow3 = [color, Color.black, color]
                    self.updateDumboboard()
                case "o":
                    firstSquareRow1 = [color, color, color]
                    firstSquareRow2 = [color, Color.black, color]
                    firstSquareRow3 = [color, color, color]
                    self.updateDumboboard()
                default: break
                }
            case "square2":
                switch played {
                case "x":
                    secondSquareRow1 = [color, Color.black, color]
                    secondSquareRow2 = [Color.black, color, Color.black]
                    secondSquareRow3 = [color, Color.black, color]
                    self.updateDumboboard()
                case "o":
                    secondSquareRow1 = [color, color, color]
                    secondSquareRow2 = [color, Color.black, color]
                    secondSquareRow3 = [color, color, color]
                    self.updateDumboboard()
                default: break
                }
            case "square3":
                switch played {
                case "x":
                    thirdSquareRow1 = [color, Color.black, color]
                    thirdSquareRow2 = [Color.black, color, Color.black]
                    thirdSquareRow3 = [color, Color.black, color]
                    self.updateDumboboard()
                case "o":
                    thirdSquareRow1 = [color, color, color]
                    thirdSquareRow2 = [color, Color.black, color]
                    thirdSquareRow3 = [color, color, color]
                    self.updateDumboboard()
                default: break
                }
            case "square4":
                switch played {
                case "x":
                    fourthSquareRow1 = [color, Color.black, color]
                    fourthSquareRow2 = [Color.black, color, Color.black]
                    fourthSquareRow3 = [color, Color.black, color]
                    self.updateDumboboard()
                case "o":
                    fourthSquareRow1 = [color, color, color]
                    fourthSquareRow2 = [color, Color.black, color]
                    fourthSquareRow3 = [color, color, color]
                    self.updateDumboboard()
                default: break
                }
            case "square5":
                switch played {
                case "x":
                    fifthSquareRow1 = [color, Color.black, color]
                    fifthSquareRow2 = [Color.black, color, Color.black]
                    fifthSquareRow3 = [color, Color.black, color]
                    self.updateDumboboard()
                case "o":
                    fifthSquareRow1 = [color, color, color]
                    fifthSquareRow2 = [color, Color.black, color]
                    fifthSquareRow3 = [color, color, color]
                    self.updateDumboboard()
                default: break
                }
            case "square6":
                switch played {
                case "x":
                    sixthSquareRow1 = [color, Color.black, color]
                    sixthSquareRow2 = [Color.black, color, Color.black]
                    sixthSquareRow3 = [color, Color.black, color]
                    self.updateDumboboard()
                case "o":
                    sixthSquareRow1 = [color, color, color]
                    sixthSquareRow2 = [color, Color.black, color]
                    sixthSquareRow3 = [color, color, color]
                    self.updateDumboboard()
                default: break
                }
            case "square7":
                switch played {
                case "x":
                    seventhSquareRow1 = [color, Color.black, color]
                    seventhSquareRow2 = [Color.black, color, Color.black]
                    seventhSquareRow3 = [color, Color.black, color]
                    self.updateDumboboard()
                case "o":
                    seventhSquareRow1 = [color, color, color]
                    seventhSquareRow2 = [color, Color.black, color]
                    seventhSquareRow3 = [color, color, color]
                    self.updateDumboboard()
                default: break
                }
            case "square8":
                switch played {
                case "x":
                    eighthSquareRow1 = [color, Color.black, color]
                    eighthSquareRow2 = [Color.black, color, Color.black]
                    eighthSquareRow3 = [color, Color.black, color]
                    self.updateDumboboard()
                case "o":
                    eighthSquareRow1 = [color, color, color]
                    eighthSquareRow2 = [color, Color.black, color]
                    eighthSquareRow3 = [color, color, color]
                    self.updateDumboboard()
                default: break
                }
            case "square9":
                switch played {
                case "x":
                    ninthSquareRow1 = [color, Color.black, color]
                    ninthSquareRow2 = [Color.black, color, Color.black]
                    ninthSquareRow3 = [color, Color.black, color]
                    self.updateDumboboard()
                case "o":
                    ninthSquareRow1 = [color, color, color]
                    ninthSquareRow2 = [color, Color.black, color]
                    ninthSquareRow3 = [color, color, color]
                    self.updateDumboboard()
                default: break
                }
            default: break
            }
        }
    }
    
    func updateDumboboard() {
        guard let color = Network.shared.thisPersonsColor else { return }
        let firstRow = [tenthPoint, ninthPointA, eighthPointA, seventhPointA, sixthPointA, fifthPointA, fourthPointA, thirdPointA, secondPointA, firstPointA]
        let secondRow = [ninthPointB] + firstSquareRow1 + secondSquareRow1 + [color, Color.black, color]
        let thirdRow = [eighthPointB] + firstSquareRow2 + secondSquareRow2 + [Color.black, color, Color.black]
        let fourthRow = [seventhPointB] + firstSquareRow3 + secondSquareRow3 + [color, Color.black, color]
        let fifthRow = [ninthPointB] + fourthSquareRow1 + fifthSquareRow1 + sixthSquareRow1
        let sixthRow = [eighthPointB] + fourthSquareRow2 + fifthSquareRow2 + sixthSquareRow2
        let seventhRow = [seventhPointB] + fourthSquareRow3 + fifthSquareRow3 + sixthSquareRow3
        let eighthRow = [ninthPointB] + seventhSquareRow1 + eighthSquareRow1 + ninthSquareRow1
        let ninthRow = [eighthPointB] + seventhSquareRow2 + eighthSquareRow2 + ninthSquareRow2
        let tenthRow = [seventhPointB] + seventhSquareRow3 + eighthSquareRow3 + ninthSquareRow3
        let x = firstRow + secondRow + thirdRow + fourthRow + fifthRow + sixthRow + seventhRow + eighthRow + ninthRow + tenthRow
        Network.shared.set(colors: x)
    }

    @IBAction func firstButtonTapped(_ sender: UIButton) {
        Network.shared.updateSquare("square1", with: "x") {
        }
    }
    
    @IBAction func secondButtonTapped(_ sender: UIButton) {
        Network.shared.updateSquare("square2", with: "x") {
        }
    }
    
    @IBAction func thirdButtonTapped(_ sender: UIButton) {
        Network.shared.updateSquare("square3", with: "x") {
        }
    }
    
    @IBAction func fourthButtonTapped(_ sender: UIButton) {
        Network.shared.updateSquare("square4", with: "x") {
        }
    }
    
    @IBAction func fifthButtonTapped(_ sender: UIButton) {
        Network.shared.updateSquare("square5", with: "x") {
        }
    }
    
    @IBAction func sixthButtonTapped(_ sender: UIButton) {
        Network.shared.updateSquare("square6", with: "x") {
        }
    }
    
    @IBAction func seventhButtonTapped(_ sender: UIButton) {
        Network.shared.updateSquare("square7", with: "x") {
        }
    }
    
    @IBAction func eighthButtonTapped(_ sender: UIButton) {
        Network.shared.updateSquare("square8", with: "x") {
        }
    }
    
    @IBAction func ninthButtonTapped(_ sender: UIButton) {
        Network.shared.updateSquare("square9", with: "x") {
        }
    }
}

