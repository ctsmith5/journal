//
//  DetailViewController.swift
//  Notebook
//
//  Created by Colin Smith on 3/8/19.
//  Copyright © 2019 Colin Smith. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //Landing Pad
    var selectedNote: Note?
    
    //MARK: - Outlets
    @IBOutlet weak var bodyTextLabel: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let checkNote = selectedNote else {return}
        bodyTextLabel.text = checkNote.bodyText
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let bodyTextFilled = bodyTextLabel.text else {return}
        if let noteIsSelected = selectedNote {
            NoteController.sharedInstance.updateNoteWith(selectedNote: noteIsSelected, newBodyText: bodyTextFilled)
        }else{
            NoteController.sharedInstance.createNoteWith(newBodyText: bodyTextFilled)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
}
