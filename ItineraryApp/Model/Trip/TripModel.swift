//
//  TripModel.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 25/08/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import Foundation


class TripModel {
    
    let id: UUID // this is not a string because I optimized memory in that way
    var title: String
    
    
    init(title: String) {
        id = UUID()
        self.title = title
    }
    
}
