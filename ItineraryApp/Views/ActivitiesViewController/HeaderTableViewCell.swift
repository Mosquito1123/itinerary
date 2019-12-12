//
//  HeaderTableViewCell.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 13/09/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit


class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.font = UIFont(name: Theme.bodyFontNameBold, size: 17)
        subtitleLabel.font = UIFont(name: Theme.bodyFontName, size: 15)
        
    }
    
    func setup(model: DayModel) {
        titleLabel.text = model.title.mediumDate()
        subtitleLabel.text = model.subtitle
    }
    
}
