//
//  PopupUIButton.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 02/09/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit


class PopupUIButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = Theme.tint
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)
    }
    
}
