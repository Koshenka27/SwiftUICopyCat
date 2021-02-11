//
//  ChatView.swift
//  SwiftUICopyCat
//
//  Created by Logan  Koshenka on 2/11/21.
//

import SwiftUI

struct ChatView: View {
    var date = formatDate(date: Date())
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .foregroundColor(Color("dateBubble"))
                        .frame(width: 180, height: 30, alignment: .center)
                    Text(date)
                }
                
                Text("This is an informational bubble to start the chat.")
                    .font(.callout)
                    .frame(width: 330, height: 60, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .foregroundColor(Color("infoBubble"))
                            .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: -10))
                            .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 1)
                    )
                
                ChatBubble(direction: .left) {
                    Text("Hello!")
                        .padding(20)
                        .foregroundColor(Color.black)
                        .background(Color.white)
                }
                .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 1)
                
                ChatBubble(direction: .right) {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ut semper quam. Phasellus non mauris sem. Donec sed fermentum eros. Donec pretium nec turpis a semper")
                        .padding(20)
                        .foregroundColor(Color.black)
                        .background(Color("outgoingChat"))
                }
                .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 1)
                
                ChatBubble(direction: .right) {
                    Image.init("p4")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 70,height: 200)
                        .aspectRatio(contentMode: .fill)
                }
                .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 1)
            }
        }
        .background(Image("whatsAppBackground"))
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
