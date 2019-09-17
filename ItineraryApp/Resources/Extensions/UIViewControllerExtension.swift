//
//  UIViewControllerExtension.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 17/09/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit


extension UIViewController {
    
    /**
     Just returns the initial view controller on a storyboard
    */
    static func getInstance() -> UIViewController {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController()!
    }
}
