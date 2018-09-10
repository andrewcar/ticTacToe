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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func firstButtonTapped(_ sender: UIButton) {
        let firstRow = [tenthPoint, ninthPointA, eighthPointA, seventhPointA, sixthPointA, fifthPointA, fourthPointA, thirdPointA, secondPointA, firstPointA]
        let secondRow = [ninthPointB] + [Color.teal, Color.black, Color.teal] + secondSquareRow1 + thirdSquareRow1
        let thirdRow = [eighthPointB] + [Color.black, Color.teal, Color.black] + secondSquareRow2 + thirdSquareRow2
        let fourthRow = [seventhPointB] + [Color.teal, Color.black, Color.teal] + secondSquareRow3 + thirdSquareRow3
        let fifthRow = [ninthPointB] + fourthSquareRow1 + fifthSquareRow1 + sixthSquareRow1
        let sixthRow = [eighthPointB] + fourthSquareRow2 + fifthSquareRow2 + sixthSquareRow2
        let seventhRow = [seventhPointB] + fourthSquareRow3 + fifthSquareRow3 + sixthSquareRow3
        let eighthRow = [ninthPointB] + seventhSquareRow1 + eighthSquareRow1 + ninthSquareRow1
        let ninthRow = [eighthPointB] + seventhSquareRow2 + eighthSquareRow2 + ninthSquareRow2
        let tenthRow = [seventhPointB] + seventhSquareRow3 + eighthSquareRow3 + ninthSquareRow3
        let x = firstRow + secondRow + thirdRow + fourthRow + fifthRow + sixthRow + seventhRow + eighthRow + ninthRow + tenthRow
        Network.shared.set(colors: x)
    }
    
    @IBAction func secondButtonTapped(_ sender: UIButton) {
        let firstRow = [tenthPoint, ninthPointA, eighthPointA, seventhPointA, sixthPointA, fifthPointA, fourthPointA, thirdPointA, secondPointA, firstPointA]
        let secondRow = [ninthPointB] + firstSquareRow1 + [Color.teal, Color.black, Color.teal] + thirdSquareRow1
        let thirdRow = [eighthPointB] + firstSquareRow2 + [Color.black, Color.teal, Color.black] + thirdSquareRow2
        let fourthRow = [seventhPointB] + firstSquareRow3 + [Color.teal, Color.black, Color.teal] + thirdSquareRow3
        let fifthRow = [ninthPointB] + fourthSquareRow1 + fifthSquareRow1 + sixthSquareRow1
        let sixthRow = [eighthPointB] + fourthSquareRow2 + fifthSquareRow2 + sixthSquareRow2
        let seventhRow = [seventhPointB] + fourthSquareRow3 + fifthSquareRow3 + sixthSquareRow3
        let eighthRow = [ninthPointB] + seventhSquareRow1 + eighthSquareRow1 + ninthSquareRow1
        let ninthRow = [eighthPointB] + seventhSquareRow2 + eighthSquareRow2 + ninthSquareRow2
        let tenthRow = [seventhPointB] + seventhSquareRow3 + eighthSquareRow3 + ninthSquareRow3
        let x = firstRow + secondRow + thirdRow + fourthRow + fifthRow + sixthRow + seventhRow + eighthRow + ninthRow + tenthRow
        Network.shared.set(colors: x)
    }
    
    @IBAction func thirdButtonTapped(_ sender: UIButton) {
        let firstRow = [tenthPoint, ninthPointA, eighthPointA, seventhPointA, sixthPointA, fifthPointA, fourthPointA, thirdPointA, secondPointA, firstPointA]
        let secondRow = [ninthPointB] + firstSquareRow1 + secondSquareRow1 + [Color.teal, Color.black, Color.teal]
        let thirdRow = [eighthPointB] + firstSquareRow2 + secondSquareRow2 + [Color.black, Color.teal, Color.black]
        let fourthRow = [seventhPointB] + firstSquareRow3 + secondSquareRow3 + [Color.teal, Color.black, Color.teal]
        let fifthRow = [ninthPointB] + fourthSquareRow1 + fifthSquareRow1 + sixthSquareRow1
        let sixthRow = [eighthPointB] + fourthSquareRow2 + fifthSquareRow2 + sixthSquareRow2
        let seventhRow = [seventhPointB] + fourthSquareRow3 + fifthSquareRow3 + sixthSquareRow3
        let eighthRow = [ninthPointB] + seventhSquareRow1 + eighthSquareRow1 + ninthSquareRow1
        let ninthRow = [eighthPointB] + seventhSquareRow2 + eighthSquareRow2 + ninthSquareRow2
        let tenthRow = [seventhPointB] + seventhSquareRow3 + eighthSquareRow3 + ninthSquareRow3
        let x = firstRow + secondRow + thirdRow + fourthRow + fifthRow + sixthRow + seventhRow + eighthRow + ninthRow + tenthRow
        Network.shared.set(colors: x)
    }
    
    @IBAction func fourthButtonTapped(_ sender: UIButton) {
        let firstRow = [tenthPoint, ninthPointA, eighthPointA, seventhPointA, sixthPointA, fifthPointA, fourthPointA, thirdPointA, secondPointA, firstPointA]
        let secondRow = [ninthPointB] + firstSquareRow1 + secondSquareRow1 + thirdSquareRow1
        let thirdRow = [eighthPointB] + firstSquareRow2 + secondSquareRow2 + thirdSquareRow2
        let fourthRow = [seventhPointB] + firstSquareRow3 + secondSquareRow3 + thirdSquareRow3
        let fifthRow = [ninthPointB] + [Color.teal, Color.black, Color.teal] + fifthSquareRow1 + sixthSquareRow1
        let sixthRow = [eighthPointB] + [Color.black, Color.teal, Color.black] + fifthSquareRow2 + sixthSquareRow2
        let seventhRow = [seventhPointB] + [Color.teal, Color.black, Color.teal] + fifthSquareRow3 + sixthSquareRow3
        let eighthRow = [ninthPointB] + seventhSquareRow1 + eighthSquareRow1 + ninthSquareRow1
        let ninthRow = [eighthPointB] + seventhSquareRow2 + eighthSquareRow2 + ninthSquareRow2
        let tenthRow = [seventhPointB] + seventhSquareRow3 + eighthSquareRow3 + ninthSquareRow3
        let x = firstRow + secondRow + thirdRow + fourthRow + fifthRow + sixthRow + seventhRow + eighthRow + ninthRow + tenthRow
        Network.shared.set(colors: x)
    }
    
    @IBAction func fifthButtonTapped(_ sender: UIButton) {
        let firstRow = [tenthPoint, ninthPointA, eighthPointA, seventhPointA, sixthPointA, fifthPointA, fourthPointA, thirdPointA, secondPointA, firstPointA]
        let secondRow = [ninthPointB] + firstSquareRow1 + secondSquareRow1 + thirdSquareRow1
        let thirdRow = [eighthPointB] + firstSquareRow2 + secondSquareRow2 + thirdSquareRow2
        let fourthRow = [seventhPointB] + firstSquareRow3 + secondSquareRow3 + thirdSquareRow3
        let fifthRow = [ninthPointB] + fourthSquareRow1 + [Color.teal, Color.black, Color.teal] + sixthSquareRow1
        let sixthRow = [eighthPointB] + fourthSquareRow2 + [Color.black, Color.teal, Color.black] + sixthSquareRow2
        let seventhRow = [seventhPointB] + fourthSquareRow3 + [Color.teal, Color.black, Color.teal] + sixthSquareRow3
        let eighthRow = [ninthPointB] + seventhSquareRow1 + eighthSquareRow1 + ninthSquareRow1
        let ninthRow = [eighthPointB] + seventhSquareRow2 + eighthSquareRow2 + ninthSquareRow2
        let tenthRow = [seventhPointB] + seventhSquareRow3 + eighthSquareRow3 + ninthSquareRow3
        let x = firstRow + secondRow + thirdRow + fourthRow + fifthRow + sixthRow + seventhRow + eighthRow + ninthRow + tenthRow
        Network.shared.set(colors: x)
    }
    
    @IBAction func sixthButtonTapped(_ sender: UIButton) {
        let firstRow = [tenthPoint, ninthPointA, eighthPointA, seventhPointA, sixthPointA, fifthPointA, fourthPointA, thirdPointA, secondPointA, firstPointA]
        let secondRow = [ninthPointB] + firstSquareRow1 + secondSquareRow1 + thirdSquareRow1
        let thirdRow = [eighthPointB] + firstSquareRow2 + secondSquareRow2 + thirdSquareRow2
        let fourthRow = [seventhPointB] + firstSquareRow3 + secondSquareRow3 + thirdSquareRow3
        let fifthRow = [ninthPointB] + fourthSquareRow1 + fifthSquareRow1 + [Color.teal, Color.black, Color.teal]
        let sixthRow = [eighthPointB] + fourthSquareRow2 + fifthSquareRow2 + [Color.black, Color.teal, Color.black]
        let seventhRow = [seventhPointB] + fourthSquareRow3 + fifthSquareRow3 + [Color.teal, Color.black, Color.teal]
        let eighthRow = [ninthPointB] + seventhSquareRow1 + eighthSquareRow1 + ninthSquareRow1
        let ninthRow = [eighthPointB] + seventhSquareRow2 + eighthSquareRow2 + ninthSquareRow2
        let tenthRow = [seventhPointB] + seventhSquareRow3 + eighthSquareRow3 + ninthSquareRow3
        let x = firstRow + secondRow + thirdRow + fourthRow + fifthRow + sixthRow + seventhRow + eighthRow + ninthRow + tenthRow
        Network.shared.set(colors: x)
    }
    
    @IBAction func seventhButtonTapped(_ sender: UIButton) {
        let firstRow = [tenthPoint, ninthPointA, eighthPointA, seventhPointA, sixthPointA, fifthPointA, fourthPointA, thirdPointA, secondPointA, firstPointA]
        let secondRow = [ninthPointB] + firstSquareRow1 + secondSquareRow1 + thirdSquareRow1
        let thirdRow = [eighthPointB] + firstSquareRow2 + secondSquareRow2 + thirdSquareRow2
        let fourthRow = [seventhPointB] + firstSquareRow3 + secondSquareRow3 + thirdSquareRow3
        let fifthRow = [ninthPointB] + fourthSquareRow1 + fifthSquareRow1 + sixthSquareRow1
        let sixthRow = [eighthPointB] + fourthSquareRow2 + fifthSquareRow2 + sixthSquareRow2
        let seventhRow = [seventhPointB] + fourthSquareRow3 + fifthSquareRow3 + sixthSquareRow3
        let eighthRow = [ninthPointB] + [Color.teal, Color.black, Color.teal] + eighthSquareRow1 + ninthSquareRow1
        let ninthRow = [eighthPointB] + [Color.black, Color.teal, Color.black] + eighthSquareRow2 + ninthSquareRow2
        let tenthRow = [seventhPointB] + [Color.teal, Color.black, Color.teal] + eighthSquareRow3 + ninthSquareRow3
        let x = firstRow + secondRow + thirdRow + fourthRow + fifthRow + sixthRow + seventhRow + eighthRow + ninthRow + tenthRow
        Network.shared.set(colors: x)
    }
    
    @IBAction func eighthButtonTapped(_ sender: UIButton) {
        let firstRow = [tenthPoint, ninthPointA, eighthPointA, seventhPointA, sixthPointA, fifthPointA, fourthPointA, thirdPointA, secondPointA, firstPointA]
        let secondRow = [ninthPointB] + firstSquareRow1 + secondSquareRow1 + thirdSquareRow1
        let thirdRow = [eighthPointB] + firstSquareRow2 + secondSquareRow2 + thirdSquareRow2
        let fourthRow = [seventhPointB] + firstSquareRow3 + secondSquareRow3 + thirdSquareRow3
        let fifthRow = [ninthPointB] + fourthSquareRow1 + fifthSquareRow1 + sixthSquareRow1
        let sixthRow = [eighthPointB] + fourthSquareRow2 + fifthSquareRow2 + sixthSquareRow2
        let seventhRow = [seventhPointB] + fourthSquareRow3 + fifthSquareRow3 + sixthSquareRow3
        let eighthRow = [ninthPointB] + seventhSquareRow1 + [Color.teal, Color.black, Color.teal] + ninthSquareRow1
        let ninthRow = [eighthPointB] + seventhSquareRow2 + [Color.black, Color.teal, Color.black] + ninthSquareRow2
        let tenthRow = [seventhPointB] + seventhSquareRow3 + [Color.teal, Color.black, Color.teal] + ninthSquareRow3
        let x = firstRow + secondRow + thirdRow + fourthRow + fifthRow + sixthRow + seventhRow + eighthRow + ninthRow + tenthRow
        Network.shared.set(colors: x)
    }
    
    @IBAction func ninthButtonTapped(_ sender: UIButton) {
        let firstRow = [tenthPoint, ninthPointA, eighthPointA, seventhPointA, sixthPointA, fifthPointA, fourthPointA, thirdPointA, secondPointA, firstPointA]
        let secondRow = [ninthPointB] + firstSquareRow1 + secondSquareRow1 + thirdSquareRow1
        let thirdRow = [eighthPointB] + firstSquareRow2 + secondSquareRow2 + thirdSquareRow2
        let fourthRow = [seventhPointB] + firstSquareRow3 + secondSquareRow3 + thirdSquareRow3
        let fifthRow = [ninthPointB] + fourthSquareRow1 + fifthSquareRow1 + sixthSquareRow1
        let sixthRow = [eighthPointB] + fourthSquareRow2 + fifthSquareRow2 + sixthSquareRow2
        let seventhRow = [seventhPointB] + fourthSquareRow3 + fifthSquareRow3 + sixthSquareRow3
        let eighthRow = [ninthPointB] + seventhSquareRow1 + eighthSquareRow1 + [Color.teal, Color.black, Color.teal]
        let ninthRow = [eighthPointB] + seventhSquareRow2 + eighthSquareRow2 + [Color.black, Color.teal, Color.black]
        let tenthRow = [seventhPointB] + seventhSquareRow3 + eighthSquareRow3 + [Color.teal, Color.black, Color.teal]
        let x = firstRow + secondRow + thirdRow + fourthRow + fifthRow + sixthRow + seventhRow + eighthRow + ninthRow + tenthRow
        Network.shared.set(colors: x)
    }
}

