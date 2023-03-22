//
//  Query.swift
//  ChatGPTApp
//
//  Created by Brenda Saavedra  on 21/03/23.
//

import Foundation

struct Query: Identifiable, Hashable {
    let id = UUID()
    let question: String
    let answer: String
}
