//
//  DateView.swift
//  GitHubRepos
//
//  Created by iSlam AbdelAziz on 27/07/2025.
//

import SwiftUI

struct DateView: View {
    @State var date: Date?
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, YYYY."
        return formatter
    }()
    
    var body: some View {
        if let diff = date?.getDiffInMonths(), diff > 6 {
            Text(diff > 12 ? "\(diff / 12) years ago" : "\(diff) months ago")
                .font(.caption)
                .foregroundStyle(.black.opacity(0.7))
        } else {
            Text(dateFormatter.string(from: date ?? Date()))
                .font(.caption)
                .foregroundStyle(.black.opacity(0.7))
        }
    }
}

#Preview {
    DateView(date: randomDate(fromDaysAgo: 3, toYearsAgo: 2))
}
