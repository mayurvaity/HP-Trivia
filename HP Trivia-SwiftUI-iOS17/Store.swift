//
//  Store.swift
//  HP Trivia-SwiftUI-iOS17
//
//  Created by Mayur Vaity on 22/07/24.
//

import Foundation
import StoreKit

//enum of book statuses
enum BookStatus {
    case active
    case inactive
    case locked
}

//@MainActor - we want this to run on main thread as it is tied so closely to the app
@MainActor
class Store: ObservableObject {
    //var to store bookstatus for each book
    @Published var books: [BookStatus] = [.active, .active, .inactive, .locked, .locked, .locked, .locked]
    //array of storekit products (ones we created in HPConfig file)
    @Published var products: [Product] = []
    
    //list of product ids created in HPConfig
    private var productIDs = ["hp4", "hp5", "hp6", "hp7"]
    
    //fn to fill abv products array 
    func loadProducts() async {
        do {
            //getting all the products using list of product ids
            products = try await Product.products(for: productIDs)
        } catch {
            print("Couldn't fetch those products: \(error)")
        }
    }
    
}
