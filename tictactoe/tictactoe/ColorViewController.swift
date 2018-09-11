//
//  ColorViewController.swift
//  tictactoe
//
//  Created by Andrew Carvajal on 9/10/18.
//  Copyright © 2018 Tendigi. All rights reserved.
//

import Foundation
import Firebase

class ColorViewController: UIViewController {
    
    @IBOutlet weak var tealButton: UIButton!
    @IBOutlet weak var lightBlueButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var pinkButton: UIButton!
    @IBOutlet weak var magentaButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Network.shared.putBobRossOnTheDumbotron()
        Network.shared.updateFirestoreRefs()
        Network.shared.updateColorsListenerAndSingleton {
            self.updateColorViews()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(updateColorViews), name: NSNotification.Name(rawValue: "ColorsUpdated"), object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func updateColorViews() {
        for (color, name) in Network.shared.colors {
            if name != "0" {
                switch color {
                case "teal": self.tealButton.alpha = 0.3; self.tealButton.isUserInteractionEnabled = false
                case "lightBlue": self.lightBlueButton.alpha = 0.3; self.lightBlueButton.isUserInteractionEnabled = false
                case "blue": self.blueButton.alpha = 0.3; self.blueButton.isUserInteractionEnabled = false
                case "purple": self.purpleButton.alpha = 0.3; self.purpleButton.isUserInteractionEnabled = false
                case "yellow": self.yellowButton.alpha = 0.3; self.yellowButton.isUserInteractionEnabled = false
                case "red": self.redButton.alpha = 0.3; self.redButton.isUserInteractionEnabled = false
                case "orange": self.orangeButton.alpha = 0.3; self.orangeButton.isUserInteractionEnabled = false
                case "green": self.greenButton.alpha = 0.3; self.greenButton.isUserInteractionEnabled = false
                case "pink": self.pinkButton.alpha = 0.3; self.pinkButton.isUserInteractionEnabled = false
                case "magenta": self.magentaButton.alpha = 0.3; self.magentaButton.isUserInteractionEnabled = false
                default: break
                }
            } else {
                switch color {
                case "teal": self.tealButton.alpha = 1.0; self.tealButton.isUserInteractionEnabled = true
                case "lightBlue": self.lightBlueButton.alpha = 1.0; self.lightBlueButton.isUserInteractionEnabled = true
                case "blue": self.blueButton.alpha = 1.0; self.blueButton.isUserInteractionEnabled = true
                case "purple": self.purpleButton.alpha = 1.0; self.purpleButton.isUserInteractionEnabled = true
                case "yellow": self.yellowButton.alpha = 1.0; self.yellowButton.isUserInteractionEnabled = true
                case "red": self.redButton.alpha = 1.0; self.redButton.isUserInteractionEnabled = true
                case "orange": self.orangeButton.alpha = 1.0; self.orangeButton.isUserInteractionEnabled = true
                case "green": self.greenButton.alpha = 1.0; self.greenButton.isUserInteractionEnabled = true
                case "pink": self.pinkButton.alpha = 1.0; self.pinkButton.isUserInteractionEnabled = true
                case "magenta": self.magentaButton.alpha = 1.0; self.magentaButton.isUserInteractionEnabled = true
                default: break
                }
            }
        }
    }
    
    func push() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "person")
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func tealButtonTapped(_ sender: UIButton) {
        Network.shared.thisPersonsColor = "teal"
        push()
    }
    
    @IBAction func lightBlueButton(_ sender: UIButton) {
        Network.shared.thisPersonsColor = "lightBlue"
        push()
    }
    
    @IBAction func blueButtonTapped(_ sender: UIButton) {
        Network.shared.thisPersonsColor = "blue"
        push()
    }
    
    @IBAction func purpleButtonTapped(_ sender: UIButton) {
        Network.shared.thisPersonsColor = "purple"
        push()
    }
    
    @IBAction func yellowButtonTapped(_ sender: UIButton) {
        Network.shared.thisPersonsColor = "yellow"
        push()
    }
    
    @IBAction func redButtonTapped(_ sender: UIButton) {
        Network.shared.thisPersonsColor = "red"
        push()
    }
    
    @IBAction func orangeButtonTapped(_ sender: UIButton) {
        Network.shared.thisPersonsColor = "orange"
        push()
    }
    
    @IBAction func greenButtonTapped(_ sender: UIButton) {
        Network.shared.thisPersonsColor = "green"
        push()
    }
    
    @IBAction func pinkButtonTapped(_ sender: UIButton) {
        Network.shared.thisPersonsColor = "pink"
        push()
    }
    
    @IBAction func magentaButtonTapped(_ sender: UIButton) {
        Network.shared.thisPersonsColor = "magenta"
        push()
    }
}
