//
//  WordView.swift
//  Boca
//
//  Created by Yuquan Shan on 4/6/24.
//

import SwiftUI

struct WordView : View {
    @Binding var word : Book.Word
    
    var body: some View {
        ZStack{
            List {
                Section(header: Text(word.word).font(.title)) {
                    Text(word.explain)
                }
                
                Section(header: Text("Examples")) {
                    ForEach(word.sentences) {sentence in Text(sentence.content)}
                }
            }
        }
        //Text("hello world")
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(word: .constant(Book.sampleData[0].words[0]))
    }
}
