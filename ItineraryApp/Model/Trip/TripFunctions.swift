//
//  TripFunctions.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 25/08/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//

import Foundation

class TripFunctions {
    
    static func createTrip(tripModel: TripModel) {
    
    }
    
    static func readTrip( completion: @escaping () -> () ) {
        DispatchQueue.global(qos: .userInteractive).async {
            
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Mexico"))
                Data.tripModels.append(TripModel(title: "Italy"))
                Data.tripModels.append(TripModel(title: "Romania"))
            }
        }
        DispatchQueue.main.async {
            completion()
        }
    }
    
    static func updateTrip(tripModel: TripModel) {
        
    }
    
    static func deleteTrip(tripModel: TripModel) {
        
    }
    
}
