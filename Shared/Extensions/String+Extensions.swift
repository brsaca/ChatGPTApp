//
//  String+Extensions.swift
//  ChatGPTApp
//
//  Created by Brenda Saavedra  on 21/03/23.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
