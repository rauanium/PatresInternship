//
//  PostModel.swift
//  PatresInternship
//
//  Created by rauan on 7/5/25.
//

import Foundation

struct PostModel: Codable, Equatable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
