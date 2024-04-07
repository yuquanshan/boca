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
    @State private var editBookId : UUID = Book.reservedBookId
    let saveAction: ()->Void
    @State private var isPresentingEditBookView = false
    var body: some View {
        NavigationStack {
            List($books) { $book in
                NavigationLink(destination: WordsView(words: $book.words, book: $book)) {
                    BookCardView(book: book)
                }
                .listRowBackground(book.theme.mainColor)
                .swipeActions(edge: .trailing) {
                    Button {
                        let id = book.id
                        books = books.filter {$0.id != id}
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    Button {
                        editBookId = book.id
                        isPresentingEditBookView = true
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }
                    .tint(.blue)
                }
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
        .sheet(isPresented: $isPresentingEditBookView) {
            EditBookSheet(books: $books, isPresentingEditBookView: $isPresentingEditBookView,
            editBookId: $editBookId)
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
