//
//  SecondViewController.swift
//  NotePad
//
//  Created by Mehmet Serhat Gültekin on 14.07.2023.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        var notes: [String] = UserDefaults.standard.array(forKey: "note") as? [String] ?? []
        
        guard let note = textField.text else { return }
        
        notes.append(note)
        
        UserDefaults.standard.set(notes, forKey: "note")
        
        dismiss(animated: true)
    }
    
   
}
    

