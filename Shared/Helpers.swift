//
//  Helpers.swift
//  SwiftUICopyCat
//
//  Created by Logan  Koshenka on 2/11/21.
//

import SwiftUI
import Foundation

let screen = UIScreen.main.bounds


func formatDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "E, MMM d"
    
    return dateFormatter.string(from: date)
}
