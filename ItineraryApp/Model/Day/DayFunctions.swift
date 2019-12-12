//
//  DayFunctions.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 17/09/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import Foundation


class DayFunctions {
    
    static func createDay(at tripIndex: Int, using dayModel: DayModel) {
         // Replace with real data store code
        
        Data.tripModels[tripIndex].dayModels.append(dayModel)
    }
}

