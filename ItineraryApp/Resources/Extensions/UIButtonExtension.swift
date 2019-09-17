//
//  UIButtonExtensions.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 31/08/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit


extension UIButton {
    
    func addFloatingAndRoundedStyle() {
        
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
    
}
