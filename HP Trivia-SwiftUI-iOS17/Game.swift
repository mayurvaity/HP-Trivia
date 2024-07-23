//
//  Game.swift
//  HP Trivia-SwiftUI-iOS17
//
//  Created by Mayur Vaity on 23/07/24.
//

import Foundation

//this is a view model

//@MainActor - we want this to run on main thread as it is tied so closely to the app
@MainActor
class Game: ObservableObject {
    //to keep collection of all questions
    private var allQuestions: [Question] = []
    
    //an array to keep list of answered questions
    private var answeredQuestions: [Int] = []
    
    //to keep colln of filtered qestions (by selected books)
    var filteredQuestions: [Question] = []
    
    //var to keep current question, initializing it with sample question
    var currentQuestion = Constants.previewQuestion
    
    init() {
        //to gather data from trivia file, as soon as a new obj is created
        decodeQuestions()
    }
    
    //fn to filter questions based on list of books passed 
    func filterQuestions(to books: [Int]) {
        filteredQuestions = allQuestions.filter { books.contains( $0.book) }
    }
    
    //fn to select next question
    func newQuestion() {
        //checking if the list has any questions
        if filteredQuestions.isEmpty { return}
        
        //checking if all the available questions were answered
        //if so then clearing the answeredQuestions array
        if answeredQuestions.count == filteredQuestions.count {
            answeredQuestions = []
        }
        
        //getting a random question
        var potentialQuestion = filteredQuestions.randomElement()!
        //running a while loop while checking if question was already answered
        //if answered, getting another random question
        //if not answered, selecting that question to show
        while answeredQuestions.contains(potentialQuestion.id) {
            potentialQuestion = filteredQuestions.randomElement()!
        }
        //making selected question currentQuestion
        currentQuestion = potentialQuestion
    }
    
    //fn to decode questions data from trivia file and store in abv var
    private func decodeQuestions() {
        if let url = Bundle.main.url(forResource: "trivia", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                allQuestions = try decoder.decode([Question].self, from: data)
                filteredQuestions = allQuestions
            } catch {
                print("Error decoding JSON data, \(error)")
            }
        }
            
    }
}
