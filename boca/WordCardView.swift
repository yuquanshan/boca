//
//  WordCardView.swift
//  boca
//
//  Created by Yuquan Shan on 3/31/24.
//

import SwiftUI

struct WordCardView: View {
    let word: Book.Word
    let theme: Theme
    var body: some View {
        VStack(alignment: .leading) {
            Text(word.word)
                .font(.title2)
        }
        .padding()
        .foregroundColor(theme.accentColor)
    }
}

struct WordCardView_Previews: PreviewProvider {
    static var book = Book.sampleData[0]
    static var previews: some View {
        WordCardView(word: book.words[0], theme: book.theme)
            .background(book.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
