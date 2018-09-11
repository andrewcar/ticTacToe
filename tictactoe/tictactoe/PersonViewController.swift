//
//  PersonViewController.swift
//  tictactoe
//
//  Created by Andrew Carvajal on 9/10/18.
//  Copyright © 2018 Tendigi. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func push() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "play")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        guard let text = nameTextField.text else { return }
        Network.shared.thisPersonsName = text
        guard let color = Network.shared.thisPersonsColor else { return }
        Network.shared.updateColor(color, with: text) {
            self.push()
        }
    }
}
