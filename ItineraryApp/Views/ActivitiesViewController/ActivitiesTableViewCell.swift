//
//  ActivitiesTableViewCell.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 15/09/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit


class ActivitiesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var activityTypeImgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.addShadowAndRoundedCorners()                                 // set
        titleLabel.font = UIFont(name: Theme.bodyFontNameDemiBold, size: 17) //    the
        subtitleLabel.font = UIFont(name: Theme.bodyFontName, size: 17)     //        theme
    }
    
    // set the content of cell
    func setup(model: ActivityModel){
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        activityTypeImgView.image = getActivityTypeImgView(type: model.activityType)
    }
    
    // set the image of cell
    func getActivityTypeImgView(type: ActivityType) -> UIImage {
        
        switch type {
            
        case .auto:
            return #imageLiteral(resourceName: "Car")
        case .excursion:
            return #imageLiteral(resourceName: "Excursion")
        case .flight:
            return #imageLiteral(resourceName: "Flight")
        case .food:
            return #imageLiteral(resourceName: "Food")
        case .hotel:
            return #imageLiteral(resourceName: "Hotel")
        }
        
    }
    
}
