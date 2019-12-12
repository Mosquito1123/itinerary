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
        mockTrips.append(TripModel(title: "Japan", image: #imageLiteral(resourceName: "japan")))
        mockTrips.append(TripModel(title: "Los Angeles"))
        
        return mockTrips
    }
    
    
    static func createMockTitleModelData() -> [DayModel] {
        var dayModels = [DayModel]()
        
        dayModels.append(DayModel(title: Date(), subtitle: "Departure", data: createMockSubtitleModelData(sectionTitle: "April 18")))
        
        dayModels.append(DayModel(title: Date().add(days: 1), subtitle: "Exploring", data: createMockSubtitleModelData(sectionTitle: "April 19")))
        
        dayModels.append(DayModel(title: Date().add(days: 2), subtitle: "Scuba Diving!", data: createMockSubtitleModelData(sectionTitle: "April 20")))
        
        dayModels.append(DayModel(title: Date().add(days: 3), subtitle: "Volunteering", data: createMockSubtitleModelData(sectionTitle: "April 21")))
        
        dayModels.append(DayModel(title: Date().add(days: 4), subtitle: "Time to back home", data: createMockSubtitleModelData(sectionTitle: "April 22")))
        
        
        return dayModels
    }
    
    
    
    static func createMockSubtitleModelData(sectionTitle: String) -> [ActivityModel] {
        
        var mockSectionModel = [ActivityModel]()
        
        if(sectionTitle == "April 18") {
            mockSectionModel.append(ActivityModel(title: "Mock data1", subtitle: "Excursion", activityType: .excursion))
            mockSectionModel.append(ActivityModel(title: "Mock data1", subtitle: "Auto", activityType: .auto))
            mockSectionModel.append(ActivityModel(title: "Mock data1", subtitle: "Food", activityType: .food))
        }
        
        if(sectionTitle == "April 19") {
            mockSectionModel.append(ActivityModel(title: "Mock data2", subtitle: "Excursion", activityType: .excursion))
            mockSectionModel.append(ActivityModel(title: "Mock data2", subtitle: "Flight", activityType: .flight))
            mockSectionModel.append(ActivityModel(title: "Mock data2", subtitle: "Food", activityType: .food))
        }
        
        if(sectionTitle == "April 20") {
            mockSectionModel.append(ActivityModel(title: "Mock data3", subtitle: "Excursion", activityType: .excursion))
            mockSectionModel.append(ActivityModel(title: "Mock data3", subtitle: "Hotel", activityType: .hotel))
            mockSectionModel.append(ActivityModel(title: "Mock data3", subtitle: "Food", activityType: .food))
        }
        
        if(sectionTitle == "April 21") {
            mockSectionModel.append(ActivityModel(title: "Mock data4", subtitle: "Excursion", activityType: .excursion))
            mockSectionModel.append(ActivityModel(title: "Mock data4", subtitle: "Hotel", activityType: .hotel))
            mockSectionModel.append(ActivityModel(title: "Mock data4", subtitle: "Food", activityType: .food))
        }
        
        if(sectionTitle == "April 22") {
            mockSectionModel.append(ActivityModel(title: "Mock data5", subtitle: "Excursion", activityType: .excursion))
            mockSectionModel.append(ActivityModel(title: "Mock data5", subtitle: "Hotel", activityType: .hotel))
            mockSectionModel.append(ActivityModel(title: "Mock data5", subtitle: "Food", activityType: .food))
        }
        
        return mockSectionModel
    }
    
}
