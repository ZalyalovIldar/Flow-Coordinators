//
//  LoginFlowCoordinator.swift
//  TestCoordinators
//
//  Created by Ildar Zalyalov on 2022-03-03.
//

import Foundation
import UIKit

protocol LoginFlowCoordinatorHandler: AnyObject {
    
    func didPressLogin()
    
    func didPressSignUp()
}

class LoginFlowCoordinator: NSObject, Coordinator {
    
    var childDependencies: CoordinatorDependencies
    weak var flowListener: CoordinatorFlowListener?
    weak var navigationController: UINavigationController?
    
    
    init(navigationController: UINavigationController?,
         childDependencies: CoordinatorDependencies = DefaultCoordinatorDependencies(),
         flowListener: CoordinatorFlowListener?) {
        
        self.navigationController = navigationController
        self.childDependencies = childDependencies
        self.flowListener = flowListener
    }
    
    func start() {
        
        guard let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController else { fatalError() }
        mainVC.loginCoordinatorHandler = self
        
        navigationController?.pushViewController(mainVC, animated: false)
    }
    
}

extension LoginFlowCoordinator: CoordinatorFlowListener {
    
    func onFlowFinished(coordinator: Coordinator) {
        childDependencies.remove(dependency: coordinator)
        
        flowListener?.onFlowFinished(coordinator: coordinator)
    }
}


extension LoginFlowCoordinator: LoginFlowCoordinatorHandler {
    
    func didPressLogin() {
        
        let mainScreen = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainScreen")
        navigationController?.pushViewController(mainScreen, animated: true)
    }
    
    func didPressSignUp() {
        
        let registrationCoordinator = RegistrationFlowCoordinator(navigationController: navigationController, flowListener: self)
        childDependencies.add(dependency: registrationCoordinator)
        registrationCoordinator.start()
    }
}
