//
//  BookStore.swift
//  boca
//
//  Created by Yuquan Shan on 3/31/24.
//

import SwiftUI

@MainActor
class BookStore: ObservableObject {
    @Published var books: [Book] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("books.data")
    }
    
    func load() async throws {
        let task = Task<[Book], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let books = try JSONDecoder().decode([Book].self, from: data)
            return books
        }
        let books = try await task.value
        self.books = books
    }
    
    func save(scrums: [Book]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(scrums)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
