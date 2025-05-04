//
//  DayViewModel.swift
//  Calendly
//
//  Created by mac on 5/3/25.
//

import Foundation

class DayViewModel: ObservableObject {
    @Published var dates = [Date]()
    @Published var selectedDate: Date?
    var currentDate: Date

    init(currentDate: Date) {
        self.currentDate = currentDate
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: currentDate)
        
        
    }
}
