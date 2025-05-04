//
//  HomeViewModel.swift
//  Calendly
//
//  Created by mac on 5/3/25.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    @Published var selectedMonth = 0
    @Published var selectedDate = Date()
    @Published var path = NavigationPath()
    
    func fetchDates() -> [CalendarDate] {
        let calendar = Calendar.current
        let currentMonth = fetchSeletedMonth()
        
        var dates = currentMonth.datesOfMonth().map({ CalendarDate(day: calendar.component(.day, from: $0), date: $0) })
        
        let firstDayOfWeek = calendar.component(.weekday, from: dates.first?.date ?? Date())
        
        for _ in 0..<firstDayOfWeek - 1 {
            dates.insert(CalendarDate(day: -1, date: Date()), at: 0)
        }
        
       return dates
    }
    
    func fetchSeletedMonth() -> Date {
        let calendar = Calendar.current
        
        let month = calendar.date(byAdding: .month, value: selectedMonth, to: Date())
        
        return month!
    }
    
}
