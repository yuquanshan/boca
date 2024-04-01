//
//  ErrorWrapper.swift
//  boca
//
//  Created by Yuquan Shan on 3/31/24.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID

    let error: Error
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
