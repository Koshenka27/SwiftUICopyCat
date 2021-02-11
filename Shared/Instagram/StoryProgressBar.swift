//
//  StoryProgressBar.swift
//  SwiftUICopyCat
//
//  Created by Logan  Koshenka on 2/11/21.
//

import SwiftUI

struct StoryProgressBar: View {
    @State var width: CGFloat = 100
    @Binding var show: Bool
    var time = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var seconds: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color.white.opacity(0.6))
                .frame(height: 3)
            
            Rectangle()
                .fill(Color.white)
                .frame(width: width, height: 3)
        }
        .onReceive(time) { (_) in
            seconds += 0.1
            
            if seconds <= 6 {
                width = screen.width * (seconds / 6)
            } else {
                show = false
            }
        }
    }
}

struct StoryProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        StoryProgressBar(show: .constant(true))
    }
}
