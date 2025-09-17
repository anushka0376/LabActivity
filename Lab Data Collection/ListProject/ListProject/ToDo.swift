//
//  ToDo.swift
//  ListProject
//
//  Created by  Anushka on 01/09/25.
//

import Foundation

let toDoDocumentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let toDoArchiveURL = toDoDocumentDirectory.appendingPathComponent("todos").appendingPathExtension("plist")

struct ToDo: Codable, Equatable {
    let id: UUID
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    init(id: UUID = UUID(), title: String, isComplete: Bool, dueDate: Date, notes: String? = nil) {
        self.id = id
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
    }
    
    static func ==(lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    static func saveToDos(_ toDos: [ToDo]) {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let data = try encoder.encode(toDos)
            try data.write(to: toDoArchiveURL, options: .noFileProtection)
            print("✅ ToDos saved to file at:", toDoArchiveURL.path)
        } catch {
            print("❌ Error saving todos:", error)
        }
    }
    
    static func loadToDos() -> [ToDo] {
        let decoder = PropertyListDecoder()
        do {
            let data = try Data(contentsOf: toDoArchiveURL)
            let decodedToDos = try decoder.decode([ToDo].self, from: data)
            print("📖 Loaded todos from file")
            return decodedToDos
        } catch {
            print("⚠️ No saved todos found, using defaults")
            return []
        }
    }
    
    // MARK: - Sample Data
    
    static func loadSampleToDos() -> [ToDo] {
        let toDo1 = ToDo(
            title: "Finish iOS Assignment",
            isComplete: false,
            dueDate: Date().addingTimeInterval(86400),
            notes: "Work on Swift structs and enums"
        )
        let toDo2 = ToDo(
            title: "Grocery Shopping",
            isComplete: true,
            dueDate: Date().addingTimeInterval(-86400),
            notes: "Buy milk, eggs, and bread"
        )
        let toDo3 = ToDo(
            title: "Prepare for DSA Exam",
            isComplete: false,
            dueDate: Date().addingTimeInterval(3 * 86400),
            notes: "Revise arrays and linked lists"
        )
        return [toDo1, toDo2, toDo3]
    }
}

// Global array (optional)
var toDos: [ToDo] = []
