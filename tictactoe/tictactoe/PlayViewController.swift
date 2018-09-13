//
//  PlayViewController.swift
//  tictactoe
//
//  Created by Andrew Carvajal on 9/10/18.
//  Copyright © 2018 Tendigi. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
   
    @IBOutlet var playerXImageView: UIImageView!
    @IBOutlet var playerOImageView: UIImageView!
    @IBOutlet var playerXLabel: UILabel!
    @IBOutlet var playerOLabel: UILabel!
    
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    @IBOutlet var fourthButton: UIButton!
    @IBOutlet var fifthButton: UIButton!
    @IBOutlet var sixthButton: UIButton!
    @IBOutlet var seventhButton: UIButton!
    @IBOutlet var eighthButton: UIButton!
    @IBOutlet var ninthButton: UIButton!
    
    var oneIsLocked = false
    var twoIsLocked = false
    var threeIsLocked = false
    var fourIsLocked = false
    var fiveIsLocked = false
    var sixIsLocked = false
    var sevenIsLocked = false
    var eightIsLocked = false
    var nineIsLocked = false

    var currentPlayer = "x"
    
    var xWins = false
    var oWins = false
    
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
    
    var currentGame = "Andrew_vs_Bob_1"

    @IBAction func setGreenToZero(_ sender: UIButton) {
        Network.shared.setGreenToZero()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        playerXImageView.layer.cornerRadius = playerXImageView.frame.width / 2
        playerOImageView.layer.cornerRadius = playerOImageView.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateSquares), name: NSNotification.Name(rawValue: "CurrentGameSquaresUpdated"), object: nil)
        
        resetPhoneboard()
        Network.shared.resetGame {
        }
        Network.shared.updateCurrentGameSquaresListenerAndSingleton(game: currentGame) {
        }
    }
    
    func resetPhoneboard() {
        firstButton.setTitle(" ", for: .normal)
        secondButton.setTitle(" ", for: .normal)
        thirdButton.setTitle(" ", for: .normal)
        fourthButton.setTitle(" ", for: .normal)
        fifthButton.setTitle(" ", for: .normal)
        sixthButton.setTitle(" ", for: .normal)
        seventhButton.setTitle(" ", for: .normal)
        eighthButton.setTitle(" ", for: .normal)
        ninthButton.setTitle(" ", for: .normal)
    }
    
    func checkForWinner() {
        guard !Network.shared.currentGameSquares.isEmpty else { return }
        guard let one = Network.shared.currentGameSquares["square1"] else { return }
        guard let two = Network.shared.currentGameSquares["square2"] else { return }
        guard let three = Network.shared.currentGameSquares["square3"] else { return }
        guard let four = Network.shared.currentGameSquares["square4"] else { return }
        guard let five = Network.shared.currentGameSquares["square5"] else { return }
        guard let six = Network.shared.currentGameSquares["square6"] else { return }
        guard let seven = Network.shared.currentGameSquares["square7"] else { return }
        guard let eight = Network.shared.currentGameSquares["square8"] else { return }
        guard let nine = Network.shared.currentGameSquares["square9"] else { return }

        // first row
        if one.first!.key == "x" && two.first!.key == "x" && three.first!.key == "x" {
            print("WINNER! X IS GLORIOUS")
            xWins = true
        } else if one.first!.key == "o" && two.first!.key == "o" && three.first!.key == "o" {
            print("WINNER! MAKE YOUR O FACE")
            oWins = true
        }
        
        // second row
        if four.first!.key == "x" && five.first!.key == "x" && six.first!.key == "x" {
            print("WINNER! X IS GLORIOUS")
            xWins = true
        } else if four.first!.key == "o" && five.first!.key == "o" && six.first!.key == "o" {
            print("WINNER! MAKE YOUR O FACE")
            oWins = true
        }
        
        // third row
        if seven.first!.key == "x" && eight.first!.key == "x" && nine.first!.key == "x" {
            print("WINNER! X IS GLORIOUS")
            xWins = true
        } else if seven.first!.key == "o" && eight.first!.key == "o" && nine.first!.key == "o" {
            print("WINNER! MAKE YOUR O FACE")
            oWins = true
        }
        
        // first column
        if one.first!.key == "x" && four.first!.key == "x" && seven.first!.key == "x" {
            print("WINNER! X IS GLORIOUS")
            xWins = true
        } else if one.first!.key == "o" && four.first!.key == "o" && seven.first!.key == "o" {
            print("WINNER! MAKE YOUR O FACE")
            oWins = true
        }
        
        // second column
        if two.first!.key == "x" && five.first!.key == "x" && eight.first!.key == "x" {
            print("WINNER! X IS GLORIOUS")
            xWins = true
        } else if two.first!.key == "o" && five.first!.key == "o" && eight.first!.key == "o" {
            print("WINNER! MAKE YOUR O FACE")
            oWins = true
        }
        
        // third column
        if three.first!.key == "x" && six.first!.key == "x" && nine.first!.key == "x" {
            print("WINNER! X IS GLORIOUS")
            xWins = true
        } else if three.first!.key == "o" && six.first!.key == "o" && nine.first!.key == "o" {
            print("WINNER! MAKE YOUR O FACE")
            oWins = true
        }
        
        // backslash
        if one.first!.key == "x" && five.first!.key == "x" && nine.first!.key == "x" {
            print("WINNER! X IS GLORIOUS")
            xWins = true
        } else if one.first!.key == "o" && five.first!.key == "o" && nine.first!.key == "o" {
            print("WINNER! MAKE YOUR O FACE")
            oWins = true
        }
        
        // forward slash
        if three.first!.key == "x" && five.first!.key == "x" && seven.first!.key == "x" {
            print("WINNER! X IS GLORIOUS")
            xWins = true
        } else if three.first!.key == "o" && five.first!.key == "o" && seven.first!.key == "o" {
            print("WINNER! MAKE YOUR O FACE")
            oWins = true
        }
    }
    
    @objc func updateSquares() {
        for (square, played) in Network.shared.currentGameSquares {
            switch square {
            case "square1":
                for (symbol, color) in played {
                    switch symbol {
                    case "x":
                        firstSquareRow1 = [color, Color.black, color]
                        firstSquareRow2 = [Color.black, color, Color.black]
                        firstSquareRow3 = [color, Color.black, color]
                        firstButton.setTitle("x", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    case "o":
                        firstSquareRow1 = [color, color, color]
                        firstSquareRow2 = [color, Color.black, color]
                        firstSquareRow3 = [color, color, color]
                        firstButton.setTitle("o", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    default: break
                    }
                }
            case "square2":
                for (symbol, color) in played {
                    switch symbol {
                    case "x":
                        secondSquareRow1 = [color, Color.black, color]
                        secondSquareRow2 = [Color.black, color, Color.black]
                        secondSquareRow3 = [color, Color.black, color]
                        secondButton.setTitle("x", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    case "o":
                        secondSquareRow1 = [color, color, color]
                        secondSquareRow2 = [color, Color.black, color]
                        secondSquareRow3 = [color, color, color]
                        secondButton.setTitle("o", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    default: break
                    }
                }
            case "square3":
                for (symbol, color) in played {
                    switch symbol {
                    case "x":
                        thirdSquareRow1 = [color, Color.black, color]
                        thirdSquareRow2 = [Color.black, color, Color.black]
                        thirdSquareRow3 = [color, Color.black, color]
                        thirdButton.setTitle("x", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    case "o":
                        thirdSquareRow1 = [color, color, color]
                        thirdSquareRow2 = [color, Color.black, color]
                        thirdSquareRow3 = [color, color, color]
                        thirdButton.setTitle("o", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    default: break
                    }
                }
            case "square4":
                for (symbol, color) in played {
                    switch symbol {
                    case "x":
                        fourthSquareRow1 = [color, Color.black, color]
                        fourthSquareRow2 = [Color.black, color, Color.black]
                        fourthSquareRow3 = [color, Color.black, color]
                        fourthButton.setTitle("x", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    case "o":
                        fourthSquareRow1 = [color, color, color]
                        fourthSquareRow2 = [color, Color.black, color]
                        fourthSquareRow3 = [color, color, color]
                        fourthButton.setTitle("o", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    default: break
                    }
                }
            case "square5":
                for (symbol, color) in played {
                    switch symbol {
                    case "x":
                        fifthSquareRow1 = [color, Color.black, color]
                        fifthSquareRow2 = [Color.black, color, Color.black]
                        fifthSquareRow3 = [color, Color.black, color]
                        fifthButton.setTitle("x", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    case "o":
                        fifthSquareRow1 = [color, color, color]
                        fifthSquareRow2 = [color, Color.black, color]
                        fifthSquareRow3 = [color, color, color]
                        fifthButton.setTitle("o", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    default: break
                    }
                }
            case "square6":
                for (symbol, color) in played {
                    switch symbol {
                    case "x":
                        sixthSquareRow1 = [color, Color.black, color]
                        sixthSquareRow2 = [Color.black, color, Color.black]
                        sixthSquareRow3 = [color, Color.black, color]
                        sixthButton.setTitle("x", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    case "o":
                        sixthSquareRow1 = [color, color, color]
                        sixthSquareRow2 = [color, Color.black, color]
                        sixthSquareRow3 = [color, color, color]
                        sixthButton.setTitle("o", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    default: break
                    }
                }
            case "square7":
                for (symbol, color) in played {
                    switch symbol {
                    case "x":
                        seventhSquareRow1 = [color, Color.black, color]
                        seventhSquareRow2 = [Color.black, color, Color.black]
                        seventhSquareRow3 = [color, Color.black, color]
                        seventhButton.setTitle("x", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    case "o":
                        seventhSquareRow1 = [color, color, color]
                        seventhSquareRow2 = [color, Color.black, color]
                        seventhSquareRow3 = [color, color, color]
                        seventhButton.setTitle("o", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    default: break
                    }
                }
            case "square8":
                for (symbol, color) in played {
                    switch symbol {
                    case "x":
                        eighthSquareRow1 = [color, Color.black, color]
                        eighthSquareRow2 = [Color.black, color, Color.black]
                        eighthSquareRow3 = [color, Color.black, color]
                        eighthButton.setTitle("x", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    case "o":
                        eighthSquareRow1 = [color, color, color]
                        eighthSquareRow2 = [color, Color.black, color]
                        eighthSquareRow3 = [color, color, color]
                        eighthButton.setTitle("o", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    default: break
                    }
                }
            case "square9":
                for (symbol, color) in played {
                    switch symbol {
                    case "x":
                        ninthSquareRow1 = [color, Color.black, color]
                        ninthSquareRow2 = [Color.black, color, Color.black]
                        ninthSquareRow3 = [color, Color.black, color]
                        ninthButton.setTitle("x", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    case "o":
                        ninthSquareRow1 = [color, color, color]
                        ninthSquareRow2 = [color, Color.black, color]
                        ninthSquareRow3 = [color, color, color]
                        ninthButton.setTitle("o", for: .normal)
                        self.updateDumboboard()
                        guard !xWins && !oWins else { continue }
                        checkForWinner()
                    default: break
                    }
                }
            default: break
            }
        }
    }
    
    func updateDumboboard() {
        let firstRow = [tenthPoint, ninthPointA, eighthPointA, seventhPointA, sixthPointA, fifthPointA, fourthPointA, thirdPointA, secondPointA, firstPointA]
        let secondRow = [ninthPointB] + firstSquareRow1 + secondSquareRow1 + thirdSquareRow1
        let thirdRow = [eighthPointB] + firstSquareRow2 + secondSquareRow2 + thirdSquareRow2
        let fourthRow = [seventhPointB] + firstSquareRow3 + secondSquareRow3 + thirdSquareRow3
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
        if !oneIsLocked && !xWins && !oWins {
            oneIsLocked = true

            switch currentPlayer {
            case "x":
                Network.shared.updateSquare(game: currentGame, square: "square1", symbol: "x", color: Color.teal) {
                    self.currentPlayer = "o"
                }
            case "o":
                Network.shared.updateSquare(game: currentGame, square: "square1", symbol: "o", color: Color.orange) {
                    self.currentPlayer = "x"
                }
            default: break
            }
        }
    }
    
    @IBAction func secondButtonTapped(_ sender: UIButton) {
        if !twoIsLocked && !xWins && !oWins {
            twoIsLocked = true
            
            switch currentPlayer {
            case "x":
                Network.shared.updateSquare(game: currentGame, square: "square2", symbol: "x", color: Color.teal) {
                    self.currentPlayer = "o"
                }
            case "o":
                Network.shared.updateSquare(game: currentGame, square: "square2", symbol: "o", color: Color.orange) {
                    self.currentPlayer = "x"
                }
            default: break
            }
        }
    }
    
    @IBAction func thirdButtonTapped(_ sender: UIButton) {
        if !threeIsLocked && !xWins && !oWins {
            threeIsLocked = true
            
            switch currentPlayer {
            case "x":
                Network.shared.updateSquare(game: currentGame, square: "square3", symbol: "x", color: Color.teal) {
                    self.currentPlayer = "o"
                }
            case "o":
                Network.shared.updateSquare(game: currentGame, square: "square3", symbol: "o", color: Color.orange) {
                    self.currentPlayer = "x"
                }
            default: break
            }
        }
    }
    
    @IBAction func fourthButtonTapped(_ sender: UIButton) {
        if !fourIsLocked && !xWins && !oWins {
            self.fourIsLocked = true
            
            switch currentPlayer {
            case "x":
                Network.shared.updateSquare(game: currentGame, square: "square4", symbol: "x", color: Color.teal) {
                    self.currentPlayer = "o"
                }
            case "o":
                Network.shared.updateSquare(game: currentGame, square: "square4", symbol: "o", color: Color.orange) {
                    self.currentPlayer = "x"
                }
            default: break
            }
        }
    }
    
    @IBAction func fifthButtonTapped(_ sender: UIButton) {
        if !fiveIsLocked && !xWins && !oWins {
            self.fiveIsLocked = true
            
            switch currentPlayer {
            case "x":
                Network.shared.updateSquare(game: currentGame, square: "square5", symbol: "x", color: Color.teal) {
                    self.currentPlayer = "o"
                }
            case "o":
                Network.shared.updateSquare(game: currentGame, square: "square5", symbol: "o", color: Color.orange) {
                    self.currentPlayer = "x"
                }
            default: break
            }
        }
    }
    
    @IBAction func sixthButtonTapped(_ sender: UIButton) {
        if !sixIsLocked && !xWins && !oWins {
            self.sixIsLocked = true
            
            switch currentPlayer {
            case "x":
                Network.shared.updateSquare(game: currentGame, square: "square6", symbol: "x", color: Color.teal) {
                    self.currentPlayer = "o"
                }
            case "o":
                Network.shared.updateSquare(game: currentGame, square: "square6", symbol: "o", color: Color.orange) {
                    self.currentPlayer = "x"
                }
            default: break
            }
        }
    }
    
    @IBAction func seventhButtonTapped(_ sender: UIButton) {
        if !sevenIsLocked && !xWins && !oWins {
            self.sevenIsLocked = true
            
            switch currentPlayer {
            case "x":
                Network.shared.updateSquare(game: currentGame, square: "square7", symbol: "x", color: Color.teal) {
                    self.currentPlayer = "o"
                }
            case "o":
                Network.shared.updateSquare(game: currentGame, square: "square7", symbol: "o", color: Color.orange) {
                    self.currentPlayer = "x"
                }
            default: break
            }
        }
    }
    
    @IBAction func eighthButtonTapped(_ sender: UIButton) {
        if !eightIsLocked && !xWins && !oWins {
            self.eightIsLocked = true
            
            switch currentPlayer {
            case "x":
                Network.shared.updateSquare(game: currentGame, square: "square8", symbol: "x", color: Color.teal) {
                    self.currentPlayer = "o"
                }
            case "o":
                Network.shared.updateSquare(game: currentGame, square: "square8", symbol: "o", color: Color.orange) {
                    self.currentPlayer = "x"
                }
            default: break
            }
        }
    }
    
    @IBAction func ninthButtonTapped(_ sender: UIButton) {
        if !nineIsLocked && !xWins && !oWins {
            self.nineIsLocked = true
            
            switch currentPlayer {
            case "x":
                Network.shared.updateSquare(game: currentGame, square: "square9", symbol: "x", color: Color.teal) {
                    self.currentPlayer = "o"
                }
            case "o":
                Network.shared.updateSquare(game: currentGame, square: "square9", symbol: "o", color: Color.orange) {
                    self.currentPlayer = "x"
                }
            default: break
            }
        }
    }
}

