//
//  RegistrationViewController.swift
//  TestCoordinators
//
//  Created by Ildar Zalyalov on 2022-03-03.
//

import UIKit

class RegistrationViewController: UIViewController {

    weak var flowCoordinatorHandler: RegistrationFlowCoordinatorHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func nextDidPressed(_ sender: Any) {
        
        let userInfo = UserInfo(name: "Mark", lastName: "Ivanov", dateOfBirth: "12.01.85", sex: "Male")
        flowCoordinatorHandler?.didPressNextFromUserInfo(userInfo)
    }
}
