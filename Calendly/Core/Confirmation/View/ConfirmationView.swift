//
//  ConfirmationView.swift
//  Calendly
//
//  Created by mac on 5/2/25.
//

import SwiftUI

struct ConfirmationView: View {
    var currentDate: Date
    
    var body: some View {
        VStack {
            Image("Maimai")
                .resizable()
                .scaledToFill()
                .frame(width: 128, height: 128)
                .cornerRadius(64)
            
            Text("Confirmed")
                .font(.title)
                .bold()
                .padding()
            
            Text("You are scheduled with Maimai")
            
            Divider()
                .padding()
            
            VStack(alignment: .leading, spacing: 32) {
                HStack {
                    Circle()
                        .frame(width: 28, height: 28)
                        .foregroundStyle(Color("hintOfSteelBlue"))
                    
                    Text("Calendy Course")
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
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Done")
                    .padding()
                    .foregroundStyle(.babyPowder)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.hintOfSteelBlue)
                    )
            }
            
            
            
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .top)
        .background(Color("timberBeam"))
        
        
    }
}

#Preview {
    ConfirmationView(currentDate: Date())
}
