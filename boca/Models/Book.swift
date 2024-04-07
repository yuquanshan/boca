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
    struct Sentence: Identifiable, Codable {
        let id: UUID
        var content: String
        init(id: UUID = UUID(), content: String) {
            self.id = id
            self.content = content
        }
    }
    struct Word: Identifiable, Codable {
        let id: UUID
        var word: String
        var explain: String
        var sentences: [Sentence]
        var location: String
        init(id: UUID = UUID(), word: String, explain: String, sentences: [Sentence], location: String = "") {
            self.id = id;
            self.word = word
            self.explain = explain
            self.sentences = sentences
            self.location = location
        }
    }
    static var emptyBook: Book {
        Book(title: "", words: [], theme: .sky)
    }
    
    static var emptyWord: Word {
        Word(word: "", explain: "", sentences: [])
    }
    static let reservedBookId: UUID = UUID()
    static let reservedWordId: UUID = UUID()
}

extension Book {
    static let sampleData: [Book] = [
        Book(title: "Anna Karenina",
             words: [
                Word(word: "abandon", explain: "blah", sentences: [Sentence(content:"It was abandoned")]),
                Word(word: "banish", explain: "blah", sentences: [Sentence(content: "It was banished")])
             ],
             theme: .yellow),
        Book(title: "War and Peace",
             words: [
                Word(word: "apple", explain: "blah", sentences: [Sentence(content: "An apple dropped on my head")]),
                Word(word: "beer", explain: "blah", sentences: [Sentence(content: "I brought a pack of beer")])
             ],
             theme: .poppy)
    ]
    static let emptyBooks: [Book] = []
}
