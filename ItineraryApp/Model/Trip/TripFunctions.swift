//
//  TripFunctions.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 25/08/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import Foundation


class TripFunctions {
    
    // just adding a new TripModel object in your
    // tripModels array
    static func createTrip(tripModel: TripModel) {
        Data.tripModels.append(tripModel)
    }
    
    
    static func readTrip( completion: @escaping () -> () ) {
        
        DispatchQueue.global(qos: .userInteractive).async { // thread
            
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Mexico"))
                Data.tripModels.append(TripModel(title: "Italy"))
                Data.tripModels.append(TripModel(title: "Romania"))
            }
        }
        DispatchQueue.main.async { // end thread
            completion()
        }
    }
    
    
    static func updateTrip(tripModel: TripModel) {
    }
    
    
    static func deleteTrip(index: Int) {
        
        Data.tripModels.remove(at: index)
    }
    
}
