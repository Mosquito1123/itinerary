//
//  DayModel.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 11/09/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import Foundation


public struct DayModel {
    
    public var id: String!
    public var title = Date()
    public var subtitle = ""
    public var activityModels = [ActivityModel]()
    
    public init(title: Date, subtitle: String, data: [ActivityModel]?) {
        id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        
        if let data = data {
            self.activityModels = data
        }
    }
}


extension DayModel: Comparable {
    public static func < (lhs: DayModel, rhs: DayModel) -> Bool {
        return lhs.title < rhs.title
    }
    
    public static func == (lhs: DayModel, rhs: DayModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}
