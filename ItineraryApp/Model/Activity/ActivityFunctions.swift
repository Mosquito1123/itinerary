//
//  ActivityFunctions.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 27/09/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import Foundation


class ActivityFunction {
    
    static func createActivity(at tripIndex: Int, for dayIndex: Int, using activityModel: ActivityModel) {
         // Replace with real data store code
        
        Data.tripModels[tripIndex].dayModels[dayIndex].activityModels.append(activityModel)
    }
    
    static func deleteActivity(at tripIndex: Int, for dayIndex: Int, using activityModel: ActivityModel) {
         // Replace with real data store code
        
        let dayModel = Data.tripModels[tripIndex].dayModels[dayIndex]
        
        if let index = dayModel.activityModels.firstIndex(of: activityModel) {
           Data.tripModels[tripIndex].dayModels[dayIndex].activityModels.remove(at: index)
        }
    }

}
