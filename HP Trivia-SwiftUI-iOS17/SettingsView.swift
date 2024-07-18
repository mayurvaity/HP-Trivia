//
//  SettingsView.swift
//  HP Trivia-SwiftUI-iOS17
//
//  Created by Mayur Vaity on 18/07/24.
//

import SwiftUI

struct SettingsView: View {
    //env property to dismiss this vw
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            //bg image
            InfoBackgroundImageView()
            
            VStack {
                //main title of the screen
                Text("Which books would you like to see questions from?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                ScrollView {
                    //[GridItem(), GridItem()] - only 2, as to show only 2 cols per row
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        //book state 1 - selected book (unlocked and selected)
                        //alignment: .bottomTrailing - to align all content in this vw bottom-right corner (in this case to add tick mark image at bottom-right corner of the book)
                        ZStack(alignment: .bottomTrailing) {
                            //book image
                            Image(.hp1)
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 7)
                            
                            //check mark to indicate selected book
                            Image(systemName: "checkmark.circle.fill")
                                .font(.largeTitle)
                                .imageScale(.large)
                                .foregroundStyle(.green)
                                .shadow(radius: 1)
                                .padding(3)
                        }
                        
                        //book state 2 - unselected and unlocked
                        ZStack(alignment: .bottomTrailing) {
                            //book image
                            Image(.hp2)
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 7)
                                .overlay(Rectangle().opacity(0.33)) //darkened effect on image
                            
                            //checkmark unselected (it's only a circle)
                            Image(systemName: "circle")
                                .font(.largeTitle)
                                .imageScale(.large)
                                .foregroundStyle(.green.opacity(0.5))
                                .shadow(radius: 1)
                                .padding(3)
                        }
                        
                        //book state 3 -  locked
                        ZStack {
                            //book image
                            Image(.hp3)
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 7)
                                .overlay(Rectangle().opacity(0.75)) //darkened effect on image
                            
                            //lock on the book image
                            Image(systemName: "lock.fill")
                                .font(.largeTitle)
                                .imageScale(.large)
                                .shadow(color: .white, radius: 3)
                        }
                        
                    }
                    .padding()
                }
                
                //dismiss button
                Button("Done") {
                    dismiss()
                }
                .doneButton()
                
            }
        }
    }
}

#Preview {
    SettingsView()
}
