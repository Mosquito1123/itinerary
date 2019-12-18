//
//  ActivityModel.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 11/09/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import Foundation
import UIKit


public struct ActivityModel {
    public var id: String!
    public var title = ""
    var subtitle = ""
    var activityType: ActivityType
    var photo: UIImage?
    
    
    init(title: String, subtitle: String, activityType: ActivityType, photo: UIImage? = nil) {
        id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        self.activityType = activityType
        self.photo = photo
    }
}


extension ActivityModel: Equatable {
    
    public static func == (lhs: ActivityModel, rhs: ActivityModel) -> Bool {
        return lhs.id == rhs.id 
    }
}
