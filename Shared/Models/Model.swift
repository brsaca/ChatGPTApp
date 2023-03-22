//
//  Model.swift
//  ChatGPTApp
//
//  Created by Brenda Saavedra  on 21/03/23.
//

import Foundation

class Model: ObservableObject {
    
    @Published var queries: [Query] = []
    
    func saveQuery(_ query: Query) throws {
        
        let viewContext = CoreDataManager.shared.persistentContainer.viewContext
        let historyItem = HistoryItem(context: viewContext)
        historyItem.question = query.question
        historyItem.answer = query.answer
        historyItem.dateCreated = Date()
        try viewContext.save()
        
    }
    
}
