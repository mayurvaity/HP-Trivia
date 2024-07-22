//
//  HP_Trivia_SwiftUI_iOS17App.swift
//  HP Trivia-SwiftUI-iOS17
//
//  Created by Mayur Vaity on 16/07/24.
//

import SwiftUI

@main
struct HP_Trivia_SwiftUI_iOS17App: App {
    //creating store varaible here to share with all views (as an env obj)
    @StateObject private var store = Store()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store) //passing store as an env obj 
        }
    }
}
