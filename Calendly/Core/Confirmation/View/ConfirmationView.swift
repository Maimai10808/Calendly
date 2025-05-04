//
//  ConfirmationView.swift
//  Calendly
//
//  Created by mac on 5/2/25.
//

import SwiftUI

struct ConfirmationView: View {
    var currentDate: Date
    
    @EnvironmentObject var manager: DatabaseManager
    @StateObject var viewModel: BookingViewModel
    
    @Environment(\.dismiss) var dismiss
    @State private var isUploading = false
    
    
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
            
            if isUploading {
                            ProgressView("Booking…")
                                .padding()
            } else {
                Button {
                    if !viewModel.name.isEmpty && !viewModel.email.isEmpty {
                        Task {
                            do {
                                try await manager.bookAppointment(name: viewModel.name, email: viewModel.email, notes: viewModel.notes, date: currentDate)
                                viewModel.name = ""
                                viewModel.email = ""
                                viewModel.notes = ""
                                isUploading = false
                                dismiss() // ✅ 上传成功后返回上一个页面
                                AlertPresenter.presentAlert(
                                    title: "Success",
                                    message: "Your Booking has been saved.",
                                    okTitle: "Got it"
                                )
                            } catch {
                                print(error.localizedDescription)
                                isUploading = false
                            }
                        }
                    }
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
            
            
            
            
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .top)
        .background(Color("timberBeam"))
        
        
    }
}


