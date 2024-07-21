//
//  GameplayView.swift
//  HP Trivia-SwiftUI-iOS17
//
//  Created by Mayur Vaity on 19/07/24.
//

import SwiftUI

struct GameplayView: View {
    //env var to dismiss the vw
    @Environment(\.dismiss) private var dismiss
    
    //var to handle animations
    @State private var animateViewsIn = false
    //var used to trigger celebration screen
    @State private var tappedCorrectAnswer = false
    //var used in giving that wiggling effect to question mark
    @State private var hintWiggle = false
    //for animationg next level button
    @State private var scaleNextButton = false
    
    @State private var movePointsToScore = false
    //vars for hints
    @State private var revealHint = false
    @State private var revealBook = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                //bg image
                Image("hogwarts")
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height * 1.05)
                    .overlay(Rectangle().foregroundStyle(.black.opacity(0.8)))
                
                VStack {
                    //MARK: - Controls
                    HStack {
                        Button("End Game") {
                            //to dismiss gameplay view
                            dismiss()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red.opacity(0.5))
                        
                        Spacer()
                        
                        Text("Score: 33")
                    }
                    .padding()
                    .padding(.vertical, 30)
                    
                    //MARK: - Question
                    VStack {
                        if animateViewsIn {
                            Text("Who is Harry Potter?")
                                .font(.custom(Constants.hpFont, size: 50))
                                .multilineTextAlignment(.center)
                                .padding()
                                .transition(.scale)  //transition type for animation
                        }
                    }
                    .animation(.easeIn(duration: 2), value: animateViewsIn) //animation specified with var it depends on
                    
                    Spacer()
                    
                    //MARK: - Hints 
                    HStack {
                        VStack {
                            if animateViewsIn {
                                Image(systemName: "questionmark.app.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100)
                                    .foregroundStyle(.cyan)
                                    .rotationEffect(.degrees(hintWiggle ? -13 : -17)) //to rotate image by angle in degrees
                                    .padding()
                                    .padding(.leading, 20)
                                    .transition(.offset(x: -geo.size.width/2))
                                    .onAppear {
                                        withAnimation(.easeInOut(duration: 0.1).repeatCount(9).delay(5).repeatForever()) {
                                            hintWiggle = true
                                        }
                                    } //for wiggle effect animation
                                    //to create animation of 3d rotation when clicked on it
                                    .onTapGesture {
                                        withAnimation(.easeOut(duration: 1)) {
                                            revealHint = true
                                        }
                                    }
                                    .rotation3DEffect(
                                        .degrees(revealHint ? 1440 : 0), axis: (x: 0, y: 1, z: 0)
                                    )
                                    .scaleEffect(revealHint ? 5 : 1)
                                    .opacity(revealHint ? 0 : 1)
                                    .offset(x: revealHint ? geo.size.width/2 : 0) //direction of flippng
                                // to show hint once clicked on abv btn, at the place of the button
                                    .overlay(
                                        Text("The boy who ____")
                                            .padding(.leading, 33)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.center)
                                            .opacity(revealHint ? 1 : 0)
                                            .scaleEffect(revealHint ? 1.33 : 1) //scaling animation when revealing
                                    )
                            }
                        }
                        .animation(.easeOut(duration: 1.5).delay(2), value: animateViewsIn)
                        
                        Spacer()
                        
                        VStack {
                            if animateViewsIn {
                                Image(systemName: "book.closed")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50)
                                    .foregroundStyle(.black)
                                    .frame(width: 100, height: 100)
                                    .background(.cyan)
                                    .clipShape(.rect(cornerRadius: 20))
                                    .rotationEffect(.degrees(hintWiggle ? 13 : 17))
                                    .padding()
                                    .padding(.trailing, 20)
                                    .transition(.offset(x: geo.size.width/2))
                                    .onAppear {
                                        withAnimation(.easeInOut(duration: 0.1).repeatCount(9).delay(5).repeatForever()) {
                                            hintWiggle = true
                                        }
                                    } //for wiggle effect animation
                                //to create animation of 3d rotation when clicked on it
                                    .onTapGesture {
                                        withAnimation(.easeOut(duration: 1)) {
                                            revealBook = true
                                        }
                                    }
                                    .rotation3DEffect(
                                        .degrees(revealBook ? 1440 : 0), axis: (x: 0, y: 1, z: 0)
                                    )
                                    .scaleEffect(revealBook ? 5 : 1)
                                    .opacity(revealBook ? 0 : 1)
                                    .offset(x: revealBook ? -geo.size.width/2 : 0) //direction of flippng
                                // to show hint once clicked on abv btn, at the place of the button
                                    .overlay(
                                        Image("hp1")
                                            .resizable()
                                            .scaledToFit()
                                            .padding(.trailing, 33)
                                            .opacity(revealBook ? 1 : 0)
                                            .scaleEffect(revealBook ? 1.33 : 1) //scaling animation when revealing
                                    )
                                
                            }
                        }
                        .animation(.easeOut(duration: 1.5).delay(2), value: animateViewsIn)
                        
                    }
                    .padding(.bottom)
                    
                    //MARK: - Answers
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(1..<5) {
                            i in
                            VStack {
                                if animateViewsIn {
                                    Text(i == 3 ? "The boy who basically lived and got sent to his relatives house where he was treated quite badly if I'm being honest but yeah." : "Answer \(i)")
                                        .minimumScaleFactor(0.5) //to specify minimum font size
                                        .multilineTextAlignment(.center)
                                        .padding(10)
                                        .frame(width: geo.size.width/2.15, height: 80)
                                        .background(.green.opacity(0.5))
                                        .clipShape(.rect(cornerRadius: 25))
                                        .transition(.scale)
                                }
                            }
                            .animation(.easeOut(duration: 1).delay(1.5), value: animateViewsIn)
                        }
                    }
                    
                    Spacer()
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .foregroundStyle(.white)
                
                //MARK: - Celebration screen
                VStack {
                    Spacer()
                    
                    VStack {
                        if tappedCorrectAnswer {
                            Text("5")
                                .font(.largeTitle)
                                .padding(.top, 50)
                                .transition(.offset(y: -geo.size.height/4))
                            //below are move transition mods (animate to invisible)
                                .offset(x: movePointsToScore ? geo.size.width/2.3 : 0,
                                        y: movePointsToScore ? -geo.size.height/13: 0)
                                .opacity(movePointsToScore ? 0 : 1)
                                .onAppear {
                                    withAnimation(.easeInOut(duration: 1).delay(3)) {
                                        movePointsToScore = true
                                    }
                                }
                        }
                    }
                    .animation(.easeInOut(duration: 1).delay(2), value: tappedCorrectAnswer)
                    
                    Spacer()
                    
                    VStack {
                        if tappedCorrectAnswer {
                            Text("Brilliant!")
                                .font(.custom(Constants.hpFont, size: 100))
                                .transition(.scale.combined(with: .offset(y: -geo.size.height/2))) // combined - to combine 2 diff types of animations together on this view
                        }
                    }
                    .animation(.easeInOut(duration: 1).delay(1), value: tappedCorrectAnswer)
                    
                    Spacer()
                    
                    if tappedCorrectAnswer {
                        Text("Answer 1")
                            .minimumScaleFactor(0.5) //to specify minimum font size
                            .multilineTextAlignment(.center) //text alignment when going multiline
                            .padding(10)
                            .frame(width: geo.size.width/2.15, height: 80)
                            .background(.green.opacity(0.5))
                            .clipShape(.rect(cornerRadius: 25))
                            .scaleEffect(2)
                    }
                    
                    Group {
                        Spacer()
                        Spacer()
                    }
                    
                    VStack {
                        if tappedCorrectAnswer {
                            Button("Next Level>") {
                                // TODO: next level button
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.blue.opacity(0.5))
                            .font(.largeTitle)
                            .transition(.offset(y: geo.size.height/3))
                            .scaleEffect(scaleNextButton ? 1.2 : 1) //to add animation effect to this button using var "scalePlayButton"
                            .onAppear {
                                //to start animation of the button once it appears on the screen
                                withAnimation(.easeInOut(duration: 1.3).repeatForever()) {
                                    //easeInOut - after 1.3 duration to play this animation
                                    //repeatForever - to repeat abv animation step forever
                                    //keep toggling "scalePlayButton" value to keep button animated
                                    scaleNextButton.toggle()
                                }
                            }
                        }
                    }
                    .animation(.easeInOut(duration: 2.7).delay(2.7), value: tappedCorrectAnswer)
                    
                    Group {
                        Spacer()
                        Spacer()
                    }
                }
                .foregroundStyle(.white)
                
            }
            .frame(width: geo.size.width, height: geo.size.height) //this sets size of zstack and also aligns everything within in center
        }
        .ignoresSafeArea()
        .onAppear {
            animateViewsIn = true
//            tappedCorrectAnswer = true
        }
    }
}

#Preview {
    GameplayView()
}
