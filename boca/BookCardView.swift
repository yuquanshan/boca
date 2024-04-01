//
//  BookCardView.swift
//  boca
//
//  Created by Yuquan Shan on 3/31/24.
//

import SwiftUI

struct BookCardView: View {
    let book: Book
    var body: some View {
        VStack(alignment: .leading) {
            Text(book.title)
                .font(.title2)
        }
        .padding()
        .foregroundColor(book.theme.accentColor)
    }
}

struct BookCardView_Previews: PreviewProvider {
    static var book = Book.sampleData[0]
    static var previews: some View {
        BookCardView(book: Book.sampleData[0])
            .background(book.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
