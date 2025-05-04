//
//  BookingViewModel.swift
//  Calendly
//
//  Created by mac on 5/4/25.
//

import Foundation

class BookingViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var notes = ""
}
