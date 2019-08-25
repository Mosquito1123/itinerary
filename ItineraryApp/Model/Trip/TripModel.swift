//
//  TripModel.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 25/08/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//

import Foundation

class TripModel {
    
    var id: String!
    var title: String!
    
    
    init(title: String) {
        id = UUID().uuidString
        self.title = title
    }
    
}
