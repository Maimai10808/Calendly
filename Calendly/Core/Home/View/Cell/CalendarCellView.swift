//
//  CalendarCellView.swift
//  Calendly
//
//  Created by mac on 5/3/25.
//

import SwiftUI

struct CalendarCellView: View {
    let value: CalendarDate

    var body: some View {
        ZStack {
            if value.day != -1 {
                NavigationLink {
                    DayView(viewModel: DayViewModel(currentDate: value.date))
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

