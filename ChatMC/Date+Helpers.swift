//
//  Date+Helpers.swift
//  ChatMC
//
//  Created by Simone Boni on 28/05/24.
//

import Foundation

extension Date {
    func descriptiveString(dateStyle: DateFormatter.Style = .short) -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        
        let daysBetween = self.daysBetween(date: Date())
        
        if daysBetween == 0 {
            return "Today"
        }
        else if daysBetween == 1 {
            return "Yesterday"
        }
        else
        if daysBetween < 5 {
            let weekdayIndex = Calendar.current.component(.weekday, from: self) - 1
            return formatter.weekdaySymbols[weekdayIndex]
        }
        return formatter.string (from: self)
    }
    func daysBetween(date: Date) -> Int {
        let calendar = Calendar.current
        let datel = calendar.startOfDay (for: self)
        let date2 = calendar.startOfDay (for: date)
        if let daysBetween = calendar.dateComponents([.day], from: datel, to: date2) .day {
            return daysBetween
        }
        return 0
    }
}
