//
//  SwiftUIView.swift
//  Calendly
//
//  Created by mac on 5/3/25.
//

import SwiftUI

struct TimeSlotRowView: View {
    
    let date: Date
    @Binding var selectedDate: Date?
    @EnvironmentObject var manager: DatabaseManager
    
    var body: some View {
        HStack {
            Button {
                withAnimation {
                    selectedDate = date
                }
            } label: {
                Text(date.timeFromDate())
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color(selectedDate == date ? .black : .blue))
                    .background(
                        ZStack {
                            if selectedDate == date {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color("pinkham"))
                            } else {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke()
                            }
                        }
                    )
                    .background(Color("oxford"))
            }
            
            if let selected = selectedDate, selected == date {
                NavigationLink {
                    BookingView(viewModel: BookingViewModel(), currentDate: selected)
                        .environmentObject(manager)
                } label: {
                    Text("Next")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color("burnside"))
                        )
                }
            }
        }
    }
}

