//
//  EditWordSheet.swift
//  Boca
//
//  Created by Yuquan Shan on 4/6/24.
//

import SwiftUI


struct EditWordSheet: View {
    @Binding var words: [Book.Word]
    @Binding var isPresentingEditWordView: Bool
    let editWordId: UUID
    var body: some View {
        NavigationStack {
            let idx = words.firstIndex(where: {$0.id == editWordId})
            WordEditView(word: $words[idx!])
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingEditWordView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            isPresentingEditWordView = false
                        }
                    }
                }
        }
    }
}


struct EditWordSheet_Previews: PreviewProvider {
    static var previews: some View {
        EditWordSheet(words: .constant(Book.sampleData[0].words),
            isPresentingEditWordView: .constant(true),
            editWordId: Book.sampleData[0].words[0].id
        )
    }
}
