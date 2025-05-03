//
//  Hours.swift
//  Calendly
//
//  Created by mac on 5/3/25.
//

import Foundation

struct Hours: Codable {
    let id: Int
    let createdAt: String  // 也可以用 Date，如果你设置了解码格式
    let day: Int
    let start: Int
    let end: Int

    enum CodingKeys: String, CodingKey {
        case id, day, start, end
        case createdAt = "created_at"
    }
}

struct Appointment: Codable {
    let id: Int
    let createdAt: String
    let name: String
    let email: String
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case id, name, email, date
        case createdAt = "created_at"
    }
}
