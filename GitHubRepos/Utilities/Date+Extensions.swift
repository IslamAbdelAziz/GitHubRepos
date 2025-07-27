//
//  Date+Extensions.swift
//  GitHubRepos
//
//  Created by iSlam AbdelAziz on 27/07/2025.
//

import Foundation

func randomDate(fromDaysAgo daysAgo: Int, toYearsAgo yearsAgo: Int) -> Date? {
    let calendar = Calendar.current
    let now = Date()
    
    guard
        let startDate = calendar.date(byAdding: .year, value: -yearsAgo, to: now),
        let endDate = calendar.date(byAdding: .day, value: -daysAgo, to: now)
    else {
        return nil
    }
    
    let interval = endDate.timeIntervalSince(startDate)
    let randomInterval = TimeInterval.random(in: 0...interval)
    
    return startDate.addingTimeInterval(randomInterval)
}

extension Date {
    func getDiffInMonths() -> Int {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.month], from: self, to: Date())
        return dateComponents.month ?? 0
    }
}
