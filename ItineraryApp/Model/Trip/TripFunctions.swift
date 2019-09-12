//
//  TripFunctions.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 25/08/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit


class TripFunctions {
    
    // just adding a new TripModel object in your
    // tripModels array
    static func createTrip(tripModel: TripModel) {
        Data.tripModels.append(tripModel)
    }
    
    
    static func readTrip(completion: @escaping () -> ()) {
        // Replace with real data store code
        
        DispatchQueue.global(qos: .userInteractive).async { // thread
            if Data.tripModels.count == 0 {
                Data.tripModels = MockData.createMockTripModelData()
            }
        }
        DispatchQueue.main.async { // end thread
            completion()
        }
    }
    
    
    static func readTrip(by id: UUID, completion: @escaping (TripModel?) -> ()) {
        // Replace with real data store code
        
        DispatchQueue.global(qos: .userInitiated).async {
            let trip = Data.tripModels.first(where: { $0.id == id })
            
            DispatchQueue.main.async {
                completion(trip)
            }
        }
    }
    
    
    static func updateTrip(at index: Int, title: String, image: UIImage? = nil) {
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image
    }
    
    
    static func deleteTrip(index: Int) {
        Data.tripModels.remove(at: index)
    }
    
}
