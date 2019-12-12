//
//  TripModel.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 25/08/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit


class TripModel {
    
    let id: UUID // this is not a string because I optimized memory in that way
    var title: String
    var image: UIImage?
    // model of days
    var dayModels = [DayModel]() {
        didSet{ // Observer
            // Called when a new value is assigned to dayModels
            dayModels = dayModels.sorted(by: <)
        }
    }
    
    
    init(title: String, image: UIImage? = nil, dayModels: [DayModel]? = nil) {
        id = UUID()
        self.title = title
        self.image = image
        
        // if the day exists, then add to the DayModel array
        if let dayModels = dayModels {
            self.dayModels = dayModels
        }
    }
    
}
