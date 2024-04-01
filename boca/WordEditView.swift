//
//  WordEditView.swift
//  boca
//
//  Created by Yuquan Shan on 3/31/24.
//

import SwiftUI

struct WordEditView: View {
    @Binding var word: Book.Word
    var body: some View {
        Form {
            Section(header: Text("Word Info")) {
                TextField("Word", text: $word.word)
                TextField("Explain", text: $word.explain)
                TextField("Sentence", text: $word.sentence)
                TextField("Location", text: $word.location)
            }
        }
    }
}

struct WordEditView_Previews: PreviewProvider {
    static var previews: some View {
        WordEditView(word: .constant(Book.sampleData[0].words[0]))
    }
}
