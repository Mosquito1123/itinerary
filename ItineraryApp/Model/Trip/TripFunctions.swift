//
//  TripFunctions.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 25/08/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit


public class TripFunctions {
    
    // just adding a new TripModel object in your
    // tripModels array
    public static func createTrip(tripModel: TripModel) {
        print(tripModel)
        Data.tripModels.append(tripModel)
    }
    
    
   public static func readTrip(completion: @escaping () -> ()) {
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
    
    
    public static func readTrip(by id: UUID, completion: @escaping (TripModel?) -> ()) {
        // Replace with real data store code
        
        DispatchQueue.global(qos: .userInitiated).async {
            let trip = Data.tripModels.first(where: { $0.id == id })
            
            DispatchQueue.main.async {
                completion(trip)
            }
        }
    }
    
    
    public static func updateTrip(at index: Int, title: String, image: UIImage? = nil) {
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image
    }
    
    
    public static func deleteTrip(index: Int) {
        Data.tripModels.remove(at: index)
    }
    
}
