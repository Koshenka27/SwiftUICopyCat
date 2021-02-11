//
//  Story.swift
//  SwiftUICopyCat
//
//  Created by Logan  Koshenka on 2/11/21.
//

import SwiftUI

struct Story: Identifiable {
    var id: Int
    var name: String
    var url: String
    var seen: Bool
    var profilePic: String
    var loading: Bool
}
