//
//  DayView.swift
//  Calendly
//
//  Created by mac on 5/2/25.
//

import SwiftUI

struct DayView: View {
    
    @StateObject var viewModel: DayViewModel
    @EnvironmentObject var manager: DatabaseManager
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text(viewModel.currentDate.fullMonthDayYearFormat())
                Divider().padding(.vertical)
                
                Text("Select a Time")
                    .font(.largeTitle).bold()
                Text("Duration: 30 min")
                
                ForEach(viewModel.dates, id: \.self) { date in
                    TimeSlotRowView(date: date, selectedDate: $viewModel.selectedDate)
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            self.viewModel.dates = manager.avaliableDates.filter({ $0.monthDayYearFormat() == viewModel.currentDate.monthDayYearFormat() })
        }
        .navigationTitle(viewModel.currentDate.dayOfTheWeek())
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("timberBeam"))
    }
}

#Preview {
    NavigationView {
        DayView(viewModel: DayViewModel(currentDate: Date()))
    }
}
