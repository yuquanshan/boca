//
//  bocaApp.swift
//  boca
//
//  Created by Yuquan Shan on 3/31/24.
//

import SwiftUI

@main
struct bocaApp: App {
    @StateObject private var store = BookStore()
    @State private var errorWrapper: ErrorWrapper?

    var body: some Scene {
        WindowGroup {
            BooksView(books: $store.books) {
                Task {
                    do {
                        try await store.save(scrums: store.books)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error,
                                                    guidance: "Try again later.")
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error,
                                                guidance: "Scrumdinger will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper) {
                store.books = Book.emptyBooks
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
