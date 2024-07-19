//
//  GameplayView.swift
//  HP Trivia-SwiftUI-iOS17
//
//  Created by Mayur Vaity on 19/07/24.
//

import SwiftUI

struct GameplayView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                //bg image
                Image("hogwarts")
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height * 1.05)
                    .overlay(Rectangle().foregroundStyle(.black.opacity(0.8)))
                
                VStack {
                    HStack {
                        Button("End Game") {
                            //TODO: End game
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red.opacity(0.5))
                        
                        Spacer()
                        
                        Text("Score: 33")
                    }
                    .padding()
                    .padding(.vertical, 30)
                    
                    //question
                    Text("Who is Harry Potter?")
                        .font(.custom(Constants.hpFont, size: 50))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "questionmark.app.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .foregroundStyle(.cyan)
                            .rotationEffect(.degrees(-15)) //to rotate image by angle in degrees
                            .padding()
                            .padding(.leading, 20)
                        
                        Spacer()
                        
                        Image(systemName: "book.closed")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .foregroundStyle(.black)
                            .frame(width: 100, height: 100)
                            .background(.cyan)
                            .clipShape(.rect(cornerRadius: 20))
                            .rotationEffect(.degrees(15))
                            .padding()
                            .padding(.trailing, 20)
                        
                    }
                    .padding(.bottom)
                    
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(1..<5) {
                            i in
                            Text(i == 3 ? "The boy who basically lived and got sent to his relatives house where he was treated quite badly if I'm being honest but yeah." : "Answer \(i)")
                                .minimumScaleFactor(0.5) //to specify minimum font size
                                .multilineTextAlignment(.center)
                                .padding(10)
                                .frame(width: geo.size.width/2.15, height: 80)
                                .background(.green.opacity(0.5))
                                .clipShape(.rect(cornerRadius: 25))
                        }
                    }
                    
                    Spacer()
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .foregroundStyle(.white)
                
            }
            .frame(width: geo.size.width, height: geo.size.height) //this sets size of zstack and also aligns everything within in center
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GameplayView()
}
