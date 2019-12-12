//
//  UIViewExtensions.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 31/08/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit


extension UIView {
    
    func addShadowAndRoundedCorners() {
        
        layer.shadowOpacity = 1 // make shadow visible
        layer.shadowOffset = CGSize.zero // change pozition of shadow
        layer.shadowColor = UIColor.darkGray.cgColor // change color of shadow
        layer.cornerRadius = 10 // Add corner radius
    }
}
