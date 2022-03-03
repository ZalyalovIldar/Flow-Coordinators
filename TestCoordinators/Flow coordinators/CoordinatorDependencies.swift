//
//  CoordinatorDependencies.swift
//  TestCoordinators
//
//  Created by Ildar Zalyalov on 2022-03-03.
//

import Foundation

protocol CoordinatorDependencies {
    
    func add(dependency coordinator: Coordinator)
    func remove(dependency coordinator: Coordinator)
}

final class DefaultCoordinatorDependencies: CoordinatorDependencies {
    
    private var dependencies = [Coordinator]()
    
    func add(dependency coordinator: Coordinator) {
        dependencies.append(coordinator)
    }
    
    func remove(dependency coordinator: Coordinator) {
        dependencies.removeAll(where: { $0 === coordinator })
    }
    
}
