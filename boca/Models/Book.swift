//
//  Book.swift
//  boca
//
//  Created by Yuquan Shan on 3/31/24.
//

import Foundation

struct Book: Identifiable, Codable {
    let id: UUID
    var title: String
    var words: [Word]
    var theme: Theme
    init(id: UUID = UUID(), title: String, words: [Word], theme: Theme) {
        self.id = id
        self.title = title
        self.words = words
        self.theme = theme
    }
}

extension Book {
    struct Word: Identifiable, Codable {
        let id: UUID
        var word: String
        var explain: String
        var sentence: String
        var location: String
        init(id: UUID = UUID(), word: String, explain: String, sentence: String, location: String = "") {
            self.id = id;
            self.word = word
            self.explain = explain
            self.sentence = sentence
            self.location = location
        }
    }
    static var emptyBook: Book {
        Book(title: "", words: [], theme: .sky)
    }
    
    static var emptyWord: Word {
        Word(word: "", explain: "", sentence: "")
    }
}

extension Book {
    static let sampleData: [Book] = [
        Book(title: "Anna Karenina",
             words: [
                Word(word: "abandon", explain: "blah", sentence: "It was abandoned"),
                Word(word: "banish", explain: "blah", sentence: "It was banished")
             ],
             theme: .yellow),
        Book(title: "War and Peace",
             words: [
                Word(word: "apple", explain: "blah", sentence: "An apple dropped on my head"),
                Word(word: "beer", explain: "blah", sentence: "I brought a pack of beer")
             ],
             theme: .poppy)
    ]
    static let emptyBooks: [Book] = []
}
