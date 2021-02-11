//
//  PostView.swift
//  SwiftUICopyCat
//
//  Created by Logan  Koshenka on 2/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostView: View {
    @State var post: Post
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            
            VStack {
                HStack(spacing: 15) {
                    Image("p3")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Kavsoft")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Text(post.time)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "ellipsis")
                            .renderingMode(.original)
                            .font(.title)
                    })
                }
                .padding()
                
                HStack {
                    Text(post.title)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Image(post.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: screen.width, height: 250)
                
                ZStack {
                    HStack {
                        HStack(spacing: 10) {
                            if post.reaction == "" {
                                Image(systemName: "hand.thumbsup")
                                    .font(.system(size: 22, weight: .heavy))
                                    .foregroundColor(post.liked ? Color("fb") : .gray)
                            }
                            
                            Text(post.reaction == "" ? (post.liked ? "Liked" : "Like") : "")
                                .fontWeight(.heavy)
                                .foregroundColor(post.liked ? Color("fb") : .gray)
                                
                            AnimatedImage(name: post.reaction)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                        }
                        .onTapGesture {
                            post.liked.toggle()
                        }
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in
                                    withAnimation(.easeIn) {
                                        post.show = true
                                    }
                                    withAnimation(Animation.linear(duration: 0.15)) {
                                        let x = value.location.x
                                        
                                        if x > 20 && x < 80 {
                                            post.reaction = reactions[0]
                                        } else if x > 80 && x < 140 {
                                            post.reaction = reactions[1]
                                        } else if x > 140 && x < 200 {
                                            post.reaction = reactions[2]
                                        } else if x > 200 && x < 260 {
                                            post.reaction = reactions[3]
                                        } else if x > 260 && x < 320 {
                                            post.reaction = reactions[4]
                                        } else if x > 320 && x < 380 {
                                            post.reaction = reactions[5]
                                        } else if x < 20 || x > 380 {
                                            post.reaction = ""
                                        }
                                    }
                                }
                                .onEnded { value in
                                    withAnimation(.easeOut) {
                                        post.show = false
                                    }
                                }
                        )
                        
                        Spacer()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Label(
                                title: {
                                    Text("Share")
                                        .fontWeight(.heavy)
                                        .foregroundColor(.gray)
                                },icon: {
                                    Image(systemName: "square.and.arrow.up")
                                        .font(.system(size: 22, weight: .heavy))
                                        .foregroundColor(.gray)
                                }
                            )
                        })
                    }
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Label(
                            title: {
                                Text("Comment")
                                    .fontWeight(.heavy)
                                    .foregroundColor(.gray)
                            },icon: {
                                Image(systemName: "message")
                                    .font(.system(size: 22, weight: .heavy))
                                    .foregroundColor(.gray)
                            }
                        )
                    })
                }
                .padding()
            }
            .zIndex(0)
            
            if post.show {
                ReactionView(post: $post)
                    .offset(y: -80)
                    .padding(.leading)
                    .zIndex(1)
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(image: "p2", title: "Rumored iPhone 12 MockUp", time: "05:15 pm", liked: false, reaction: ""))
    }
}
