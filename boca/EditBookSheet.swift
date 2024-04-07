//
//  EditBookView.swift
//  Boca
//
//  Created by Yuquan Shan on 3/31/24.
//

import SwiftUI


struct EditBookSheet: View {
    @Binding var books: [Book]
    @Binding var isPresentingEditBookView: Bool
    @Binding var editBookId: UUID
    var body: some View {
        NavigationStack {
            let idx = books.firstIndex(where: {$0.id == editBookId})
            BookEditView(book: $books[idx!])
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingEditBookView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            isPresentingEditBookView = false
                        }
                    }
                }
        }
    }
}


struct EditBookSheet_Previews: PreviewProvider {
    static var previews: some View {
        EditBookSheet(books: .constant(Book.sampleData),
            isPresentingEditBookView: .constant(true),
                      editBookId: .constant(Book.sampleData[0].id)
        )
    }
}
