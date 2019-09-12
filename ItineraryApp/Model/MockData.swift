//
//  MockData.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 11/09/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import Foundation


class MockData {
    
    static func createMockTripModelData() -> [TripModel] {
        
        var mockTrips = [TripModel]()
        mockTrips.append(TripModel(title: "New York", image:#imageLiteral(resourceName: "new_york"), dayModels: createMockTitleModelData()))
        mockTrips.append(TripModel(title: "Los Angeles", image: #imageLiteral(resourceName: "los_angeles")))
        mockTrips.append(TripModel(title: "Japan"))
        
        return mockTrips
    }
    
    
    static func createMockTitleModelData() -> [DayModel] {
        var dayModels = [DayModel]()
        
        dayModels.append(DayModel(title: "April 18", subtitle: "Exploring", data: createMockSubtitleModelData(sectionTitle: "April 18")))
        dayModels.append(DayModel(title: "April 19", subtitle: "Scuba Diving!", data: createMockSubtitleModelData(sectionTitle: "April 19")))
        dayModels.append(DayModel(title: "April 20", subtitle: "Time to go back home", data: createMockSubtitleModelData(sectionTitle: "April 20")))
        
        return dayModels
    }
    
    
    
    static func createMockSubtitleModelData(sectionTitle: String) -> [ActivityModel] {
        
        var mockSectionModel = [ActivityModel]()
        
        if(sectionTitle == "April 18") {
            mockSectionModel.append(ActivityModel(title: "Exploring the city", subtitle: "Cool exploring", activityType: .excursion))
            mockSectionModel.append(ActivityModel(title: "Diving to the city", subtitle: "Cool diving", activityType: .excursion))
            mockSectionModel.append(ActivityModel(title: "Eat some food", subtitle: "Cool eat", activityType: .food))
        }
        
        if(sectionTitle == "April 19") {
            mockSectionModel.append(ActivityModel(title: "Exploring1 the city", subtitle: "Cool exploring", activityType: .excursion))
            mockSectionModel.append(ActivityModel(title: "Diving1 to the city", subtitle: "Cool diving", activityType: .excursion))
            mockSectionModel.append(ActivityModel(title: "Eat1 some food", subtitle: "Cool eat", activityType: .food))
        }
        
        if(sectionTitle == "April 20") {
            mockSectionModel.append(ActivityModel(title: "Exploring2 the city", subtitle: "Cool exploring", activityType: .excursion))
            mockSectionModel.append(ActivityModel(title: "Diving2 to the city", subtitle: "Cool diving", activityType: .excursion))
            mockSectionModel.append(ActivityModel(title: "Eat2 some food", subtitle: "Cool eat", activityType: .food))
        }
        
        return mockSectionModel
    }
    
}
