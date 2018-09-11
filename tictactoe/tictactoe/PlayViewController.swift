//
//  PlayViewController.swift
//  tictactoe
//
//  Created by Andrew Carvajal on 9/10/18.
//  Copyright © 2018 Tendigi. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    // entering by:
    // being challenged
    // having no one to challenge
   
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
    
    var currentGame: String?

    @IBAction func setGreenToZero(_ sender: UIButton) {
        Network.shared.setGreenToZero()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // prepare for challenger
        if let challenger = Network.shared.challenger {
            
            // get image of challenger
            
            playerXLabel.text = challenger
            
            // get image of this player
            guard let name = Network.shared.thisPersonsName else { return }
            playerOLabel.text = name
        } else {
            
            // wait for challengee
            
            // get image of this player
            guard let name = Network.shared.thisPersonsName else { return }
            playerXLabel.text = name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let name = Network.shared.thisPersonsName else { return }
        Network.shared.updateWaitingRoom(name: name) {
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(someoneJoinedWaitingRoom), name: NSNotification.Name(rawValue: "SomeoneJoinedWaitingRoom"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateSquares), name: NSNotification.Name(rawValue: "CurrentGameUpdated"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(gamesUpdated), name: NSNotification.Name(rawValue: "GamesUpdated"), object: nil)
        
        if let currentGame = currentGame {
            Network.shared.updateCurrentGameSquaresListenerAndSingleton(game: currentGame) {
            }
            Network.shared.updateCurrentGameSymbolsListenerAndSingleton(game: currentGame) {
            }
        }
    }
    
    @objc func gamesUpdated() {
        guard !Network.shared.games.isEmpty else { return }
        guard let myName = Network.shared.thisPersonsName else { return }
        guard let enemyName = Network.shared.enemyName else { return }
        for (game, value) in Network.shared.games {
//            if game ==
        }
    }
    
    @objc func someoneJoinedWaitingRoom() {
        guard let myName = Network.shared.thisPersonsName else { return }
        guard let enemyName = Network.shared.enemyName else { return }
        statusLabel.text = "\(enemyName) has joined"
        Network.shared.getGameNumber(person1: myName, person2: enemyName) { (previousGameNumber) in
            let newGameName = "\(myName)_vs_\(enemyName)_\(previousGameNumber + 1)"
            self.currentGame = newGameName
            Network.shared.updateGame(game: newGameName, completion: {
            })
        }
    }
    
    @objc func updateSquares() {
        guard let color = Network.shared.thisPersonsColor else { return }

        for (square, played) in Network.shared.currentGameSquares {
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
        // game is my name + who ever is other player
        guard let currentGame = currentGame else { return }
        Network.shared.updateSquare(game: currentGame, square: "square1", symbol: "x") {
        }
    }
    
    @IBAction func secondButtonTapped(_ sender: UIButton) {
        guard let currentGame = currentGame else { return }
        Network.shared.updateSquare(game: currentGame, square: "square2", symbol: "x") {
        }
    }
    
    @IBAction func thirdButtonTapped(_ sender: UIButton) {
        guard let currentGame = currentGame else { return }
        Network.shared.updateSquare(game: currentGame, square: "square3", symbol: "x") {
        }
    }
    
    @IBAction func fourthButtonTapped(_ sender: UIButton) {
        guard let currentGame = currentGame else { return }
        Network.shared.updateSquare(game: currentGame, square: "square4", symbol: "x") {
        }
    }
    
    @IBAction func fifthButtonTapped(_ sender: UIButton) {
        guard let currentGame = currentGame else { return }
        Network.shared.updateSquare(game: currentGame, square: "square5", symbol: "x") {
        }
    }
    
    @IBAction func sixthButtonTapped(_ sender: UIButton) {
        guard let currentGame = currentGame else { return }
        Network.shared.updateSquare(game: currentGame, square: "square6", symbol: "x") {
        }
    }
    
    @IBAction func seventhButtonTapped(_ sender: UIButton) {
        guard let currentGame = currentGame else { return }
        Network.shared.updateSquare(game: currentGame, square: "square7", symbol: "x") {
        }
    }
    
    @IBAction func eighthButtonTapped(_ sender: UIButton) {
        guard let currentGame = currentGame else { return }
        Network.shared.updateSquare(game: currentGame, square: "square8", symbol: "x") {
        }
    }
    
    @IBAction func ninthButtonTapped(_ sender: UIButton) {
        guard let currentGame = currentGame else { return }
        Network.shared.updateSquare(game: currentGame, square: "square9", symbol: "x") {
        }
    }
}

