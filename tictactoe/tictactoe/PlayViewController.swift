//
//  PlayViewController.swift
//  tictactoe
//
//  Created by Andrew Carvajal on 9/10/18.
//  Copyright © 2018 Tendigi. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    var tenthPoint = [Color.black]
    
    var ninthPointA = [Color.black]
    var eighthPointA = [Color.black]
    var seventhPointA = [Color.black]
    var sixthPointA = [Color.black]
    var fifthPointA = [Color.black]
    var fourthPointA = [Color.black]
    var thirdPointA = [Color.black]
    var secondPointA = [Color.black]
    var firstPointA = [Color.black]
    
    var ninthPointB = [Color.black]
    var eighthPointB = [Color.black]
    var seventhPointB = [Color.black]
    var sixthPointB = [Color.black]
    var fifthPointB = [Color.black]
    var fourthPointB = [Color.black]
    var thirdPointB = [Color.black]
    var secondPointB = [Color.black]
    var firstPointB = [Color.black]

    var first = [String]()
    var second = [String]()
    var third = [String]()
    var fourth = [String]()
    var fifth = [String]()
    var sixth = [String]()
    var seventh = [String]()
    var eighth = [String]()
    var ninth = [String]()

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
        let x = firstRow +
            ninthPointB + [Color.teal, Color.black, Color.teal] + second + third +
            eighthPointB + [Color.black, Color.teal, Color.black] + fifth + sixth +
            seventhPointB + [Color.teal, Color.black, Color.teal] + eighth + ninth
        Network.shared.set(colors: x)
    }
    
    @IBAction func secondButtonTapped(_ sender: UIButton) {
        print("2")
    }
    
    @IBAction func thirdButtonTapped(_ sender: UIButton) {
        print("3")
    }
    
    @IBAction func fourthButtonTapped(_ sender: UIButton) {
        print("4")
    }
    
    @IBAction func fifthButtonTapped(_ sender: UIButton) {
        print("5")
    }
    
    @IBAction func sixthButtonTapped(_ sender: UIButton) {
        print("6")
    }
    
    @IBAction func seventhButtonTapped(_ sender: UIButton) {
        print("7")
    }
    
    @IBAction func eighthButtonTapped(_ sender: UIButton) {
        print("8")
    }
    
    @IBAction func ninthButtonTapped(_ sender: UIButton) {
        print("9")
    }
}

