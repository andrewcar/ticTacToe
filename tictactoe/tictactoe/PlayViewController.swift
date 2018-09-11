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
    
    var currentPlayer = "x"
    
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
    
    let winningCombinations = [["square1", "square2", "square3"], ["square4", "square5", "square6"], ["square7", "square8", "square9"], ["square1", "square4", "square7"], ["square2", "square5", "square8"], ["square3", "square6", "square9"], ["square1", "square5", "square9"], ["square3", "square5", "square7"]]

    @IBAction func setGreenToZero(_ sender: UIButton) {
        Network.shared.setGreenToZero()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Network.shared.resetGame {
        }
        
        playerXImageView.layer.cornerRadius = playerXImageView.frame.width / 2
        playerOImageView.layer.cornerRadius = playerOImageView.frame.width / 2

        // prepare for challenger
//        if let challenger = Network.shared.challenger {
//
//            // get image of challenger
//
//            playerXLabel.text = challenger
//
//            // get image of this player
//            guard let name = Network.shared.thisPersonsName else { return }
//            playerOLabel.text = name
//        } else {
//
//            // wait for challengee
//
//            // get image of this player
//            guard let name = Network.shared.thisPersonsName else { return }
//            playerXLabel.text = name
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(someoneJoinedWaitingRoom), name: NSNotification.Name(rawValue: "SomeoneJoinedWaitingRoom"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateSquares), name: NSNotification.Name(rawValue: "CurrentGameSquaresUpdated"), object: nil)
        
        Network.shared.updateCurrentGameSquaresListenerAndSingleton(game: currentGame) {
        }
    }
    
    func checkForWinner() {
        for combination in winningCombinations {
            
        }
        if !Network.shared.currentGameSquares.isEmpty {
            for (square, played) in Network.shared.currentGameSquares {
                switch square {
                case "square1":
                    
                case "square2":
                case "square3":
                case "square4":
                case "square5":
                case "square6":
                case "square7":
                case "square8":
                case "square9":
                default: break
                }
            }
        }
    }

//    @objc func gamesUpdated() {
//        guard !Network.shared.games.isEmpty else { return }
//        guard let myName = Network.shared.thisPersonsName else { return }
//        guard let enemyName = Network.shared.enemyName else { return }
//        for (game, value) in Network.shared.games {
////            if game ==
//        }
//    }
    
//    @objc func someoneJoinedWaitingRoom() {
//        guard let myName = Network.shared.thisPersonsName else { return }
//        guard let enemyName = Network.shared.enemyName else { return }
////        statusLabel.text = "\(enemyName) has joined"
//        Network.shared.getGameNumber(person1: myName, person2: enemyName) { (previousGameNumber) in
//            let newGameName = "\(myName)_vs_\(enemyName)_\(previousGameNumber + 1)"
//            self.currentGame = newGameName
//            Network.shared.updateGame(game: newGameName, completion: {
//            })
//        }
//    }
    
    @objc func updateSquares() {
//        guard let color = Network.shared.thisPersonsColor else { return }

        for (square, played) in Network.shared.currentGameSquares {
            switch square {
            case "square1":
                for (symbol, color) in played {
                    switch symbol {
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
                }
            case "square2":
                for (symbol, color) in played {
                    switch symbol {
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
                }
            case "square3":
                for (symbol, color) in played {
                    switch symbol {
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
                }
            case "square4":
                for (symbol, color) in played {
                    switch symbol {
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
                }
            case "square5":
                for (symbol, color) in played {
                    switch symbol {
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
                }
            case "square6":
                for (symbol, color) in played {
                    switch symbol {
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
                }
            case "square7":
                for (symbol, color) in played {
                    switch symbol {
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
                }
            case "square8":
                for (symbol, color) in played {
                    switch symbol {
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
                }
            case "square9":
                for (symbol, color) in played {
                    switch symbol {
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
    
    @IBAction func secondButtonTapped(_ sender: UIButton) {
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
    
    @IBAction func thirdButtonTapped(_ sender: UIButton) {
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
    
    @IBAction func fourthButtonTapped(_ sender: UIButton) {
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
    
    @IBAction func fifthButtonTapped(_ sender: UIButton) {
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
    
    @IBAction func sixthButtonTapped(_ sender: UIButton) {
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
    
    @IBAction func seventhButtonTapped(_ sender: UIButton) {
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
    
    @IBAction func eighthButtonTapped(_ sender: UIButton) {
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
    
    @IBAction func ninthButtonTapped(_ sender: UIButton) {
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

