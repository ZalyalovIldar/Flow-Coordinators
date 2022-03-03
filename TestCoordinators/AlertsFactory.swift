//
//  AlertsFactory.swift
//  TestCoordinators
//
//  Created by Ildar Zalyalov on 2022-03-03.
//

import Foundation
import UIKit

protocol AlertsFactory {
    
    func getAlert(by type: AlertType, title: String) -> UIViewController
}

enum AlertType {
    case okAlert
    case cancelAlert
}

class DefaultsAlertsFactory: AlertsFactory {
    
    
    func getAlert(by type: AlertType, title: String) -> UIViewController {
        
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        switch type {
        case .okAlert:
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            
            return alert
            
        case .cancelAlert:
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alert.addAction(cancelAction)
            
            return alert
        }
    }
    
    
}
