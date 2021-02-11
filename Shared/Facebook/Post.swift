//
//  Post.swift
//  SwiftUICopyCat
//
//  Created by Logan  Koshenka on 2/11/21.
//

import SwiftUI

struct Post: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var time: String
    var liked: Bool
    var reaction: String
    var show = false
}
