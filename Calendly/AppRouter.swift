//
//  AppRouter.swift
//  Calendly
//
//  Created by mac on 5/4/25.
//

import Foundation

enum AppRouter: Hashable {
    case day(date: Date)
    case booking(date: Date)
    case confirmation(date: Date)
}

