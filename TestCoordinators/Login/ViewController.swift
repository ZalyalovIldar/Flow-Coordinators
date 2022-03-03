//
//  ViewController.swift
//  TestCoordinators
//
//  Created by Ildar Zalyalov on 2022-03-03.
//

import UIKit

class ViewController: UIViewController {
    
    weak var loginCoordinatorHandler: LoginFlowCoordinatorHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonDidPress(_ sender: Any) {
        loginCoordinatorHandler?.didPressLogin()
    }
    
    @IBAction func signUpDidPressed(_ sender: Any) {
        loginCoordinatorHandler?.didPressSignUp()
    }
}

