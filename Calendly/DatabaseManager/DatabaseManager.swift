//
//  DatabaseManager.swift
//  Calendly
//
//  Created by mac on 5/3/25.
//

import Foundation
import Supabase

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let client = SupabaseClient(supabaseURL: URL(string: "https://lqlnnawhlsveedjrlwkw.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxxbG5uYXdobHN2ZWVkanJsd2t3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDYyNzgwNDcsImV4cCI6MjA2MTg1NDA0N30.xuHK5k4vMFp5UhJdR9V2SDGDJtsgRci1dxZhtDVryLc")
    
    
    private init() {
    
    }
    
    func fetchHours() async throws -> [Hours] {
        let response: [Hours] = try await client
            .from("hours")
            .select()
            .execute()
            .value

        print("✅ Fetched Hours:", response)
        return response
    }
    
    func avaliableAppointments() async throws -> [Date] {
        let appts: [Appointment] = try await client
            .from("appointments")
            .select()
            .execute()
            .value
        
        return try await generateAppointmentTimes(from: appts)
    }
    
    func generateAppointmentTimes(from appts: [Appointment]) async throws -> [Date] {
        let takenAppts: Set<Date> = Set(appts.map({ $0.date }))
        let hours = try await fetchHours()
        
        let calendar = Calendar.current
        let currentWeekday = calendar.component(.weekday, from: Date()) - 2
        
        var timeSlots = [Date]()
        for hour in hours {
            if hour.start != 0 && hour.end != 0 {
                var currentDate = calendar.date(
                    from: DateComponents(year: calendar.component(.year, from: Date()), month: calendar.component(.month, from: Date()),
                        day: calendar.component(.day, from: Date()) + (hour.day - currentWeekday),
                        hour: hour.start
                    )
                )!
                
                print(currentDate)
                while let nextDate = calendar.date(byAdding: .minute, value: 30, to: currentDate), calendar.component(.hour, from: nextDate) < hour.end {
                    if !takenAppts.contains(currentDate) && currentDate > Date() {
                        timeSlots.append(currentDate)
                    }
                    currentDate = nextDate
                }
                
            }
        }
        
        return timeSlots
    }
    
    
}





