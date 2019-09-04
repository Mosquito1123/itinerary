//
//  PopupUIView.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 02/09/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit


class PopupUIView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.shadowOpacity = 1 // make shadow visible
        layer.shadowOffset = CGSize.zero // change pozition of shadow
        layer.shadowColor = UIColor.darkGray.cgColor // change color of shadow
        layer.cornerRadius = 10 // Add corner radius
        backgroundColor = Theme.background
    }
    
}
