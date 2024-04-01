//
//  NewBookSheet.swift
//  boca
//
//  Created by Yuquan Shan on 3/31/24.
//
import SwiftUI


struct NewBookSheet: View {
    @State private var newBook = Book.emptyBook
    @Binding var books: [Book]
    @Binding var isPresentingNewBookView: Bool
    var body: some View {
        NavigationStack {
            BookEditView(book: $newBook)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewBookView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            books.append(newBook)
                            isPresentingNewBookView = false
                        }
                    }
                }
        }
    }
}


struct NewBookSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewBookSheet(books: .constant(Book.sampleData),
            isPresentingNewBookView: .constant(true))
    }
}
