//
//  MainCoordinator.swift
//  TestCoordinators
//
//  Created by Ildar Zalyalov on 2022-03-03.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var childDependencies: CoordinatorDependencies { get }
    var navigationController: UINavigationController? { get set }
    
    func start()
}

protocol CoordinatorFlowListener: AnyObject {
    func onFlowFinished(coordinator: Coordinator)
}

class MainCoordinator: Coordinator {
    
    var childDependencies: CoordinatorDependencies
    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController, childDependencies: CoordinatorDependencies = DefaultCoordinatorDependencies()) {
        self.navigationController = navigationController
        self.childDependencies = childDependencies
    }

    func start() {
        
        let loginCoordinator = LoginFlowCoordinator(navigationController: navigationController, flowListener: self)
        childDependencies.add(dependency: loginCoordinator)
        loginCoordinator.start()
    }
}

extension MainCoordinator: CoordinatorFlowListener {
    
    func onFlowFinished(coordinator: Coordinator) {
        childDependencies.remove(dependency: coordinator)
    
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let delegate = windowScene.delegate as? SceneDelegate,
                let window = delegate.window else { return }
        
        let mainScreen = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainScreen")
    
        window.rootViewController = mainScreen
        window.makeKeyAndVisible()
    }
}
