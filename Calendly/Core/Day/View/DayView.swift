//
//  DayView.swift
//  Calendly
//
//  Created by mac on 5/2/25.
//

import SwiftUI

struct DayView: View {
    @State var dates = [
        Date(),
        Calendar.current.date(byAdding: .hour, value: 1, to: Date())!,
        Calendar.current.date(byAdding: .hour, value: 2, to: Date())!,
        Calendar.current.date(byAdding: .hour, value: 3, to: Date())!,
        Calendar.current.date(byAdding: .hour, value: 4, to: Date())!,
        
    ]
    
    @State var selectedDate: Date?
    
    var body: some View {
        ScrollView {
            VStack {
                Text("August 29, 2023")
                
                Divider()
                    .padding(.vertical)
                
                Text("Select a Time")
                    .font(.largeTitle)
                    .bold()
                
                Text("Duration: 30 min")
                
                ForEach(dates, id: \.self) { date in
                    
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
                        
                        
                        if selectedDate == date {
                            NavigationLink {
                               BookingView()
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
                .padding(.horizontal)
                
            }
        }
        .navigationTitle("Saturaday")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("timberBeam"))
    }
}

#Preview {
    DayView()
}
