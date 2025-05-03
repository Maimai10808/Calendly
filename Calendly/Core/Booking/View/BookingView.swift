//
//  BookingView.swift
//  Calendly
//
//  Created by mac on 5/2/25.
//

import SwiftUI

struct BookingView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var notes = ""
    
    var currentDate: Date
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: "clock")
                    
                    Text("30 min")
                }
                
                HStack {
                    Image(systemName: "video")
                    
                    Text("FaceTime")
                }
                
                HStack(alignment: .top) {
                    Image(systemName: "calendar")
                    
                    Text(currentDate.bookingViewDateFormat())
                }
                
            }
            .padding()
            
            Divider()
            VStack(alignment: .leading, spacing: 16) {
                Text("Enter Details")
                    .font(.title)
                    .bold()
                
                Text("Name")
                
                TextField("", text: $name)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                    )
                
                Text("Email")
                
                TextField("", text: $email)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                    )
                
                Text("Please share anything that will help prepare for our meeting")
                
                TextField("", text: $notes, axis: .vertical)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                    )
                
                NavigationLink {
                    ConfirmationView(currentDate: currentDate)
                } label: {
                    Text("Schedule Event")
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color("hintOfSteelBlue"))
                        )
                }
                
                
            }
            .padding()
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle("Calendly Course")
        .background(Color("timberBeam"))
    }
}

#Preview {
    BookingView(currentDate: Date())
}
