//
//  BookEditView.swift
//  boca
//
//  Created by Yuquan Shan on 3/31/24.
//

import SwiftUI

struct BookEditView: View {
    @Binding var book: Book
    var body: some View {
        Form {
            Section(header: Text("Book Info")) {
                TextField("Title", text: $book.title)
                ThemePicker(selection: $book.theme)
            }
        }
    }
}

struct BookEditView_Previews: PreviewProvider {
    static var previews: some View {
        BookEditView(book: .constant(Book.sampleData[0]))
    }
}
