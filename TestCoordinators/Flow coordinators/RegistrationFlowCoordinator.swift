//
//  RegistrationFlowCoordinator.swift
//  TestCoordinators
//
//  Created by Ildar Zalyalov on 2022-03-03.
//

import Foundation
import UIKit

protocol RegistrationFlowCoordinatorHandler: AnyObject {
    
    func didPressNextFromUserInfo(_ info: UserInfo)
    
    func didEnterSmsCode(_ code: String)
    
    func didEnterPassword(_ password: String)
}

struct UserInfo {
    let name: String
    let lastName: String
    let dateOfBirth: String
    let sex: String
}

class RegistrationFlowCoordinator: NSObject, Coordinator {
    
    var childDependencies: CoordinatorDependencies
    weak var flowListener: CoordinatorFlowListener?
    weak var navigationController: UINavigationController?
    
    private var currentUserInfo: UserInfo?
    private var smsCode: String = String()
    private var password: String = String()
    
    init(navigationController: UINavigationController?,
         childDependencies: CoordinatorDependencies = DefaultCoordinatorDependencies(),
         flowListener: CoordinatorFlowListener?) {
        
        self.navigationController = navigationController
        self.childDependencies = childDependencies
        self.flowListener = flowListener
    }
    
    func start() {
        
        guard let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController else { fatalError() }
        mainVC.flowCoordinatorHandler = self
        
        navigationController?.delegate = self
        navigationController?.pushViewController(mainVC, animated: true)
    }
    
}

extension RegistrationFlowCoordinator: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        guard navigationController.viewControllers.contains(fromVC) else { return }

        if fromVC is SmsViewController {
            print("Returned")
        }
    }
}

extension RegistrationFlowCoordinator: RegistrationFlowCoordinatorHandler {
    
    func didPressNextFromUserInfo(_ info: UserInfo) {
        currentUserInfo = info
        
        guard let smsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SmsViewController") as? SmsViewController else { fatalError() }
        smsVC.flowCoordinatorHandler = self
    
        navigationController?.pushViewController(smsVC, animated: true)
    }
    
    func didEnterSmsCode(_ code: String) {
        self.smsCode = code
        
        guard let passwordVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PasswordViewController") as? PasswordViewController else { fatalError() }
        passwordVC.flowCoordinatorHandler = self
        
        navigationController?.pushViewController(passwordVC, animated: true)
    }
    
    func didEnterPassword(_ password: String) {
        self.password = password
        
        navigationController?.popToRootViewController(animated: false)
        
        flowListener?.onFlowFinished(coordinator: self)
    }
}
