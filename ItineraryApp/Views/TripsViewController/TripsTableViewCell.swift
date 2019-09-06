//
//  TripsTableViewCell.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 27/08/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit


class TripsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cardView.addShadowAndRoundedCorners()
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 32)
        cardView.backgroundColor = Theme.accent
        tripImageView.layer.cornerRadius = cardView.layer.cornerRadius
    }
    
    
    func setup(tripModel: TripModel){
        
        titleLabel.text = tripModel.title
        tripImageView.image = tripModel.image
    }
    
}
