//
//  NoteController.swift
//  Notebook
//
//  Created by Colin Smith on 3/8/19.
//  Copyright © 2019 Colin Smith. All rights reserved.
//

import Foundation
import CoreSpotlight

class NoteController {
    
    // Singleton
    
   static let sharedInstance = NoteController()
    
    //Source of Truth
    
    var notes : [Note] = []
    var attributeSet = [CSSearchableItemAttributeSet]()
    
    //MARK: - CRUD
    
    
    //Create
    func createNoteWith(newBodyText: String) {
        let newNote = Note(bodyText: newBodyText)
        notes.append(newNote)
    }
    
    //Read
    
    
    // Update
    func updateNoteWith(selectedNote: Note, newBodyText: String){
        selectedNote.bodyText = newBodyText
        saveToPersistentStore()
    }
    
    //Delete
    func deleteNoteWith(selectedNote: Note){
        guard let index = notes.index(of: selectedNote) else {return}
        notes.remove(at: index)
        saveToPersistentStore()
    }
    
    //MARK: - Persistence
    
    //Create FileURL
    func createFileURL() -> URL{
        let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = filePath[0]
        let fileName = "notes.json"
        let fullURL = documentDirectory.appendingPathComponent(fileName)
        return fullURL
    }
    
    //Save
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do{
           let data = try encoder.encode(notes)
                try data.write(to: createFileURL())
        }catch{
            print("There was an error \(error) \(error.localizedDescription)")
        }
        
    }
    //Load
    func loadFromPersistentStore(){
        let decoder = JSONDecoder()
        do{
           let data = try Data(contentsOf: createFileURL())
            let loadedNotes = try decoder.decode([Note].self, from: data)
            self.notes = loadedNotes
        }catch{
            print("error loading from persistent store \(error)")
        }
        
    }
}
