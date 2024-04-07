//
//  WordEditView.swift
//  boca
//
//  Created by Yuquan Shan on 3/31/24.
//

import SwiftUI

struct WordEditView: View {
    @Binding var word: Book.Word
    @State private var newSentence = ""
    var body: some View {
        Form {
            Section(header: Text("Word Info")) {
                TextField("Word", text: $word.word)
            }
            Section(header: Text("Explain")) {
                TextField("Explain", text: $word.explain, axis: .vertical)
            }
            Section(header: Text("Examples")) {
                ForEach(word.sentences) {sentence in Text(sentence.content)
                }.onDelete { indices in
                    word.sentences.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Sentence", text: $newSentence, axis: .vertical)
                    Button(action: {
                        withAnimation {
                            word.sentences.append(Book.Sentence(content: newSentence))
                            newSentence = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newSentence.isEmpty)
                }
            }
            Section(header: Text("Location")){
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
