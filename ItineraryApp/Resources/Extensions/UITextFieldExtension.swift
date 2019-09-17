//
//  UITextFieldExtension.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 17/09/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit


extension UITextField {
    
    var hasValue: Bool {
        guard text == "" else { return true }
        
        let alertImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 25))
        alertImageView.image = #imageLiteral(resourceName: "warning_icon")
        alertImageView.contentMode = .scaleAspectFit
        
        rightView = alertImageView
        rightViewMode = .unlessEditing
        
        return false
    }
}
