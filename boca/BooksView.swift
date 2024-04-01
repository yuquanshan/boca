//
//  BooksView.swift
//  boca
//
//  Created by Yuquan Shan on 3/31/24.
//

import SwiftUI


struct BooksView: View {
    @Binding var books: [Book]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewBookView = false
    let saveAction: ()->Void
    var body: some View {
        NavigationStack {
            List($books) { $book in
                NavigationLink(destination: WordsView(words: $book.words, book: $book)) {
                    BookCardView(book: book)
                }
                .listRowBackground(book.theme.mainColor)
            }
            .navigationTitle("Books")
            .toolbar {
                Button(action: {isPresentingNewBookView = true}) {
                    Image(systemName: "plus")
                }
            }
            
        }
        .sheet(isPresented: $isPresentingNewBookView) {
            NewBookSheet(books: $books, isPresentingNewBookView: $isPresentingNewBookView)
        }
        .onChange(of: scenePhase) {
            if scenePhase == .inactive { saveAction() }
        }
    }
}


struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView(books: .constant(Book.sampleData), saveAction: {})
    }
}
