//
//  ContentView.swift
//  Calendly
//
//  Created by mac on 4/30/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
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
                            viewModel.selectedMonth -= 1
                        }
                    } label: {
                        Image(systemName: "lessthan.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 28)
                            .foregroundStyle(Color("hintOfSteelBlue"))
                    }
                    
                    Spacer()
                    
                    Text(viewModel.selectedDate.monthDayYearFormat())
                        .font(.title2)
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.snappy) {
                            viewModel.selectedMonth += 1
                        }
                    } label: {
                        Image(systemName: "greaterthan.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 28)
                            .foregroundStyle(Color("hintOfSteelBlue"))
                    }
                    
                    Spacer()
                }
                
                HStack {
                    ForEach(viewModel.days, id: \.self) { day in
                        Text(day)
                            .font(.system(size: 12, weight: .medium))
                            .frame(maxWidth: .infinity)
                    }
                }
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 20) {
                    ForEach(viewModel.fetchDates()) { value in
                        CalendarCellView(value: value)
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .onChange(of: viewModel.selectedMonth) { _ in
                viewModel.selectedDate = viewModel.fetchSeletedMonth()
            
            }
            .task {
                do {
                    let appts = try await DatabaseManager.shared.avaliableAppointments()
                    print(appts)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .background(Color("timberBeam"))
        }
    }
    
    
}



#Preview {
    HomeView(viewModel: HomeViewModel())
}


