//
//  ViewController.swift
//  NotePad
//
//  Created by Mehmet Serhat Gültekin on 14.07.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,DeleteButtonProtocol {
    
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var noteArray = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        noteArray = UserDefaults.standard.array(forKey: "note") as? [String] ?? []
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath) as! NoteTableViewCell
        cell.noteLabel.text = noteArray[indexPath.row]
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
       
        return cell
        
    }
    
    func deleteButtonTapped(indexPath: IndexPath) {
        
        let savedNote = UserDefaults.standard.object(forKey: "note")
        if(savedNote as? String) != nil {
        UserDefaults.standard.removeObject(forKey: "note")
            let cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath) as! NoteTableViewCell
            cell.noteLabel.text = ""
            
    }
}
    
}


