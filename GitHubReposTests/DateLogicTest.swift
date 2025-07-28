//
//  DateLogicTest.swift
//  GitHubReposTests
//
//  Created by iSlam AbdelAziz on 28/07/2025.
//

import Testing
import Foundation

@testable import GitHubRepos

struct DateLogicTest {
    let calendar = Calendar.current
    let now = Date()
    
    @Test func testDateDiffInMonths() async throws {
        let diff = 9
        let oldDate = calendar.date(byAdding: .month, value: -diff, to: now)
        #expect(oldDate?.getDiffInMonths() == diff)
        
    }

    @Test func testRandomDateIsInCorrectDateRange() async throws {
        let maxRangeInYears: Int = 10
        let minRangeInDays: Int = 0
        
        let startDate = calendar.date(byAdding: .year, value: -maxRangeInYears, to: now)
        let endDate = calendar.date(byAdding: .day, value: -minRangeInDays, to: now)
        
        let pickedDate = randomDate(fromDaysAgo: minRangeInDays, toYearsAgo: maxRangeInYears)
        
        #expect(pickedDate != nil)
        #expect(startDate != nil)
        #expect(endDate != nil)
        #expect(pickedDate! <= endDate!)
        #expect(pickedDate! >= startDate!)
    }
}
