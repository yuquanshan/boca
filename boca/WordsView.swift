//
//  WordsView.swift
//  boca
//
//  Created by Yuquan Shan on 3/31/24.
//

import SwiftUI


struct WordsView: View {
    @Binding var words: [Book.Word]
    @Binding var book: Book
    @State private var isPresentingNewWordView = false
    @State private var isPresentingEditWordView = false
    @State private var editWordId : UUID = Book.reservedWordId
    
    var body: some View {
        NavigationStack {
            List($words) { $word in
                NavigationLink(destination: WordView(word: $word)) {
                    WordCardView(word: word, theme: book.theme)
                }
                .listRowBackground(book.theme.mainColor)
                .swipeActions(edge: .trailing) {
                    Button {
                        let id = word.id
                        words = words.filter {$0.id != id}
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    Button {
                        editWordId = word.id
                        isPresentingEditWordView = true
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }
                    .tint(.blue)
                }
            }
            .navigationTitle(book.title)
            .toolbar {
                Button(action: {isPresentingNewWordView = true}) {
                    Image(systemName: "plus")
                }
            }
            
        }
        .sheet(isPresented: $isPresentingNewWordView) {
            NewWordSheet(words: $words, isPresentingNewWordView: $isPresentingNewWordView)
        }
        .sheet(isPresented: $isPresentingEditWordView) {
            EditWordSheet(words: $words, isPresentingEditWordView: $isPresentingEditWordView, editWordId: editWordId)
        }
    }
}


struct WordsView_Previews: PreviewProvider {
    static var previews: some View {
        WordsView(words: .constant(Book.sampleData[0].words), book: .constant(Book.sampleData[0]))
    }
}
