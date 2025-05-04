//
//  CalendarCellView.swift
//  Calendly
//
//  Created by mac on 5/3/25.
//

import SwiftUI

struct CalendarCellView: View {
    
    let value: CalendarDate
    @StateObject var manager = DatabaseManager()

    var body: some View {
        ZStack {
            if value.day != -1 {
                
                let hasAppts = manager.days.contains(value.date.monthDayYearFormat())
                
                NavigationLink {
                    DayView(viewModel: DayViewModel(currentDate: value.date))
                        .environmentObject(manager)
                } label: {
                    Text("\(value.day)")
                        .foregroundStyle(hasAppts ? Color("oxford") : .black)
                        .fontWeight(hasAppts ? .bold : .none)
                        .background {
                            ZStack(alignment: .bottom) {
                                Circle()
                                    .frame(width: 48, height: 48)
                                    .foregroundStyle(hasAppts ? .blue.opacity(0.1) : .clear)
                            }
                        }
                }
                .disabled(!hasAppts)
            } else {
                Text("")
            }
        }
        .frame(width: 32, height: 32)
    }
}

