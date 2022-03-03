//
//  SmsViewController.swift
//  TestCoordinators
//
//  Created by Ildar Zalyalov on 2022-03-03.
//

import UIKit

class SmsViewController: UIViewController {

    var sms: String = String()
    
    weak var flowCoordinatorHandler: RegistrationFlowCoordinatorHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func didPressNext(_ sender: Any) {
        
        sms = "12345"
        flowCoordinatorHandler?.didEnterSmsCode(sms)
    }
}
