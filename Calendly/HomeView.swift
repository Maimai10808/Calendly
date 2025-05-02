//
//  ContentView.swift
//  Calendly
//
//  Created by mac on 4/30/25.
//

import SwiftUI

struct HomeView: View {
    let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    @State var selectedMonth = 0
    @State var selectedDate = Date()
    
    var body: some View {
        NavigationStack {
        VStack {
            Image("Maimai")
                .resizable()
                .scaledToFill()
                .frame(width: 128, height: 128)
                .cornerRadius(64)
            
            Text("Canlendly Course")
                .font(.title)
                .bold()
            
            Rectangle()
                .frame(height: 1 )
                .foregroundStyle(Color("hintOfSteelBlue"))
            
           // Selec a Day
            VStack(spacing: 20) {
                Text("Selec a Day")
                    .font(.title2)
                    .bold()
                
                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation(.snappy) {
                            selectedMonth -= 1
                        }
                    } label: {
                        Image(systemName: "lessthan")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 28)
                            .foregroundStyle(Color("hintOfSteelBlue"))
                    }
                    
                    Spacer()
                    
                    Text(selectedDate.monthDayYearFormat())
                        .font(.title2)
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.snappy) {
                            selectedMonth += 1
                        }
                    } label: {
                        Image(systemName: "greaterthan")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 28)
                            .foregroundStyle(Color("hintOfSteelBlue"))
                    }
                    
                    Spacer()
                }
                
                HStack {
                    ForEach(days, id: \.self) { day in
                        Text(day)
                            .font(.system(size: 12, weight: .medium))
                            .frame(maxWidth: .infinity)
                    }
                }
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 20) {
                    ForEach(fetchDates()) { value in
                        ZStack {
                            if value.day != -1 {
                                NavigationLink {
                                   DayView()
                                } label: {
                                    Text("\(value.day)")
                                        .foregroundStyle(value.day % 2 != 0 ? Color("oxford") : .black)
                                        .fontWeight(value.day % 2 != 0 ? .bold : .none)
                                        .background {
                                            ZStack(alignment: .bottom) {
                                                Circle()
                                                    .frame(width: 48, height: 48)
                                                    .foregroundStyle(value.day % 2 != 0 ? .blue.opacity(0.1) : .clear)
                                            }
                                        }
                                }
                                .disabled(value.day % 2 == 0)
                                    
                            } else {
                                Text("")
                            }
                        }
                        .frame(width: 32, height: 32)
                        
                    }
                
                    
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .onChange(of: selectedMonth) { _ in
                selectedDate = fetchSeletedMonth()
            
            }
        }
        .background(Color("timberBeam"))
        }
    }
    
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

struct CalendarDate: Identifiable {
    let id = UUID()
    var day: Int
    var date: Date
}

#Preview {
    HomeView()
}


