//
//  NewWordSheet.swift
//  boca
//
//  Created by Yuquan Shan on 3/31/24.
//

import SwiftUI

struct NewWordSheet: View {
    @State private var newWord = Book.emptyWord
    @Binding var words: [Book.Word]
    @Binding var isPresentingNewWordView: Bool
    var body: some View {
        NavigationStack {
            WordEditView(word: $newWord)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewWordView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            words.append(newWord)
                            isPresentingNewWordView = false
                        }
                    }
                }
        }
    }
}


struct NewWordSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewWordSheet(words: .constant(Book.sampleData[0].words),
            isPresentingNewWordView: .constant(true))
    }
}
