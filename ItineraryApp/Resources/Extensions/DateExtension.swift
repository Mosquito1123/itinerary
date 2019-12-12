//
//  DateExtension.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 18/09/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import Foundation


extension Date {
    
    /// Add days to the Day
    func add(days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: Date())!
    }
    
    func mediumDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
