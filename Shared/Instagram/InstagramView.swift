//
//  InstagramView.swift
//  SwiftUICopyCat
//
//  Created by Logan  Koshenka on 2/11/21.
//

import SwiftUI

struct InstagramView: View {
    @State var show = false
    @State var currentStory: Story
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    StoriesView(currentStory: $currentStory, show: $show)
                    
                    ForEach(0 ..< 5) { item in
                        VStack {
                            HStack {
                                Image(systemName: "person")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                Text("logankoshenka")
                                    .bold()
                                Spacer()
                                Image(systemName: "ellipsis")
                            }
                            .padding(8)
                            
                            Rectangle()
                            
                            HStack(spacing: 15) {
                                Image(systemName: "heart")
                                Image(systemName: "bubble.right")
                                Image(systemName: "paperplane")
                                Spacer()
                                Image(systemName: "bookmark")
                            }
                            .font(.title2)
                            .padding(.horizontal, 5)
                            
                            HStack {
                                Text("logankoshenka ").bold() + Text("Caption")
                                Spacer()
                            }
                            .padding(4)
                            
                        }
                        .frame(width: screen.width, height: 500)
                    }
                    .padding(4)
                }
            }
            
            if self.show {
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    
                    ZStack(alignment: .topLeading) {
                        GeometryReader { _ in
                            VStack {
                                Image(self.currentStory.url)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                        
                        VStack(spacing: 15) {
                            StoryProgressBar(show: self.$show)
                            
                            HStack(spacing: 15) {
                                Image(self.currentStory.profilePic)
                                    .resizable()
                                    .frame(width: 55, height: 55)
                                    .clipShape(Circle())
                                
                                Text(self.currentStory.name)
                                    .foregroundColor(.white)
                                
                                Spacer()
                            }
                            .padding(.leading)
                        }
                        .padding(.top)
                    }
                }
                .transition(.move(edge: .trailing))
                .onTapGesture {
                    self.show.toggle()
                }
            }
        }
    }
}

struct InstagramView_Previews: PreviewProvider {
    static var previews: some View {
        InstagramView(currentStory:Story(id: 0, name: "Justine", url: "p1", seen: false, profilePic: "img1", loading: false))
    }
}

struct StoriesView: View {
    @Binding var currentStory: Story
    @Binding var show: Bool
    @State var storyData = [
        Story(id: 0, name: "Justine", url: "p1", seen: false, profilePic: "img1", loading: false),
        Story(id: 1, name: "Emily", url: "p2", seen: false, profilePic: "img2", loading: false),
        Story(id: 2, name: "Juliana", url: "p3", seen: false, profilePic: "img3", loading: false),
        Story(id: 3, name: "Emma", url: "p4", seen: false, profilePic: "img4", loading: false),
        Story(id: 4, name: "Catherine", url: "p5", seen: false, profilePic: "img5", loading: false)
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 22) {
                Button(action: {
                    
                }) {
                    ZStack(alignment: .bottomTrailing) {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .clipShape(Circle())
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .padding(8)
                            .background(Color.white)
                            .clipShape(Circle())
                            .offset(x: 6)
                    }
                }
                
                ForEach(0..<self.storyData.count) { index in
                    ZStack {
                        Image(self.storyData[index].profilePic)
                            .resizable()
                            .frame(width: 65, height: 65)
                            .clipShape(Circle())
                        
                        if !self.storyData[index].seen {
                            Circle()
                                .trim(from: 0, to: 1)
                                .stroke(
                                    AngularGradient(gradient: Gradient(colors: [Color.red, Color.orange, Color.red]), center: .center),
                                    style: StrokeStyle(lineWidth: 4, dash: [self.storyData[index].loading ? 7 : 0])
                                )
                                .frame(width: 74, height: 74)
                                .rotationEffect(Angle(degrees: self.storyData[index].loading ? 360 : 0))
                        }
                    }
                    .frame(width: 75)
                    .onTapGesture {
                        withAnimation(Animation.default.speed(0.3)) {
                            self.storyData[index].loading.toggle()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + (self.storyData[index].seen ? 0 : 1.2)) {
                                self.currentStory = self.storyData[index]
                                
                                withAnimation {
                                    self.show.toggle()
                                }
                                
                                self.storyData[index].loading = false
                                self.storyData[index].seen = true
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}
