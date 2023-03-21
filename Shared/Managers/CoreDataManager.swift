//
//  CoreDataManager.swift
//  ChatGPTApp
//
//  Created by Brenda Saavedra  on 21/03/23.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init(){
        persistentContainer = NSPersistentContainer(name: "HistoryModel")
        persistentContainer.loadPersistentStores { NSEntityDescription, error in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
}
