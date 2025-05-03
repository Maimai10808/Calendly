//
//  DayView.swift
//  Calendly
//
//  Created by mac on 5/2/25.
//

import SwiftUI

struct DayView: View {
    
    @StateObject var viewModel: DayViewModel
    
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
