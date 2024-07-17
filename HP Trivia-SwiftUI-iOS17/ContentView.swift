//
//  ContentView.swift
//  HP Trivia-SwiftUI-iOS17
//
//  Created by Mayur Vaity on 16/07/24.
//

import SwiftUI
import AVKit

struct ContentView: View {
    //creating audio player obj
    @State private var audioPlayer: AVAudioPlayer!
    
    //for animating play button
    @State private var scalePlayButton = true
    //for animating bg image
    @State private var moveBackgroundImage = false
    //var for animating transitions
    @State private var animateViewsIn = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                //bg image
                Image("hogwarts")
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height)
                    .padding(.top, 3) //to push the image down a little
                    .offset(x: moveBackgroundImage ? geo.size.width/1.1 : -geo.size.width/1.1) //for bg animation movement
                    .onAppear {
                        withAnimation(.linear(duration: 60).repeatForever()) {
                            //linear - left right movement animation
                            //duration 60 - for 60 seconds it will move one side then to other side for 60 seconds
                            moveBackgroundImage.toggle()
                        }
                    }
                
                VStack {
                    //to apply animation modifers, need to add all that content in a vstack
                    VStack {
                        //putting all the vws involved in the animation within a if statement driven by "animateViewsIn" var
                        if animateViewsIn {
                            VStack {
                                //bolt image
                                Image(systemName: "bolt.fill")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                
                                Text("HP")
                                    .font(.custom(Constants.hpFont, size: 70))
                                    .padding(.bottom, -50) //to bring HP and Trivia words closer
                                
                                Text("Trivia")
                                    .font(.custom(Constants.hpFont, size: 60))
                            }
                            .padding(.top, 70)
                            .transition(.move(edge: .top)) //to transition in from top
                        }
                    }
                    .animation(.easeOut(duration: 0.7).delay(2), value: animateViewsIn) //to specify animation interval and manage "animateViewsIn" var
                    //it is suppose to fly in right after view loads (delay of 2 sec, and duration of animation is 0.7) and stay there
                    
                    Spacer()
                    
                    
                    //to apply animation modifers, need to add all that content in a vstack
                    VStack {
                        //putting all the vws involved in the animation within a if statement driven by "animateViewsIn" var
                        if animateViewsIn {
                            VStack {
                                Text("Recent Scores")
                                    .font(.title2)
                                
                                Text("33")
                                Text("27")
                                Text("15")
                            }
                            .font(.title3)
                            .padding(.horizontal)
                            .foregroundStyle(.white)
                            .background(.black.opacity(0.7))
                            .clipShape(.rect(cornerRadius: 15))
                            .transition(.opacity) //to just appear use "opacity"
                        }
                    }
                    .animation(.linear(duration: 1).delay(4), value: animateViewsIn) //to specify animation interval and manage "animateViewsIn" var
                    //it is suppose to appear there right after view loads (delay of 4 sec, and duration of animation is 1) and stay there
                    
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        //to apply animation modifers, need to add all that content in a vstack
                        VStack {
                            //putting all the vws involved in the animation within a if statement driven by "animateViewsIn" var
                            if animateViewsIn {
                                Button {
                                    //show instructions screen
                                } label: {
                                    Image(systemName: "info.circle.fill")
                                        .font(.largeTitle)
                                        .foregroundStyle(.white)
                                        .shadow(radius: 5)
                                }
                                .transition(.offset(x: -geo.size.width/4)) //to fly in from left
                            }
                        }
                        .animation(.easeOut(duration: 0.7).delay(2.7), value: animateViewsIn) //to specify animation interval and manage "animateViewsIn" var
                        //it is suppose to fly in right after view loads (delay of 2.7 sec, and duration of animation is 0.7) and stay there
                        
                        
                        Spacer()
                        
                        
                        //to apply animation modifers, need to add all that content in a vstack
                        VStack {
                            //putting all the vws involved in the animation within a if statement driven by "animateViewsIn" var
                            if animateViewsIn {
                                Button {
                                    //start a new game
                                } label: {
                                    Text("Play")
                                        .font(.largeTitle)
                                        .foregroundStyle(.white)
                                        .padding(.vertical, 7)
                                        .padding(.horizontal, 50)
                                        .background(.brown)
                                        .clipShape(.rect(cornerRadius: 7))
                                        .shadow(radius: 5)
                                }
                                .scaleEffect(scalePlayButton ? 1.2 : 1) //to add animation effect to this button using var "scalePlayButton"
                                .onAppear {
                                    //to start animation of the button once it appears on the screen
                                    withAnimation(.easeInOut(duration: 1.3).repeatForever()) {
                                        //easeInOut - after 1.3 duration to play this animation
                                        //repeatForever - to repeat abv animation step forever
                                        //keep toggling "scalePlayButton" value to keep button animated
                                        scalePlayButton.toggle()
                                    }
                                }
//                                .transition(.move(edge: .bottom)) //.bottom move doesn't work so need to use offset as below
                                .transition(.offset(y: geo.size.height/3)) //to specify what kind of transition it requires
                            }
                        }
                        .animation(.easeOut(duration: 0.7).delay(2), value: animateViewsIn) //to specify animation interval and manage "animateViewsIn" var
                        //it is suppose to fly in right after view loads (delay of 2 sec, and duration of animation is 0.7) and stay there
                        
                        
                        Spacer()
                        
                        //to apply animation modifers, need to add all that content in a vstack
                        VStack {
                            //putting all the vws involved in the animation within a if statement driven by "animateViewsIn" var
                            if animateViewsIn {
                                Button {
                                    //show settings screen
                                } label: {
                                    Image(systemName: "gearshape.fill")
                                        .font(.largeTitle)
                                        .foregroundStyle(.white)
                                        .shadow(radius: 5)
                                }
                                .transition(.offset(x: geo.size.width/4)) //to fly in from right
                            }
                        }
                        .animation(.easeOut(duration: 0.7).delay(2.7), value: animateViewsIn) //to specify animation interval and manage "animateViewsIn" var
                        //it is suppose to fly in right after view loads (delay of 2.7 sec, and duration of animation is 0.7) and stay there
                        
                        
                        Spacer()
                    }
                    .frame(width: geo.size.width)
                    
                    Spacer()
                }
            }
            .frame(width: geo.size.width,
                   height: geo.size.height)
        }
        .ignoresSafeArea()
        .onAppear {
            //to start playing audio from audioplayer, once this view appears on the screen
//            playAudio()
            
            //to enable title vws animation fying in on screen when app loads
            animateViewsIn = true
        }
    }
    
    //fn to get music file and setting it and playing it on audio player
    private func playAudio() {
        //creating a pth for audio file, which needs to be played
        let sound = Bundle.main.path(forResource: "magic-in-the-air", ofType: "mp3")
        //assigning abv obj to audio player
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(filePath: sound!))
        //to run this song in infinite loops use -1
        audioPlayer.numberOfLoops = -1
        //to play the audio player
        audioPlayer.play()
    }
}

#Preview {
    ContentView()
}
