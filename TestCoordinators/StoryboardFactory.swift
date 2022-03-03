//
//  StoryboardFactory.swift
//  TestCoordinators
//
//  Created by Ildar Zalyalov on 2022-03-03.
//

import Foundation
import UIKit

protocol StoryboardFactory {
    
}

class DefaultStoryboardFactory: StoryboardFactory {
    
    
    enum Storyboard: String {
        case main = "Main"
    }
    
    func getController(in storyboard) -> UIViewController
}
