//
//  NoteTableViewCell.swift
//  NotePad
//
//  Created by Mehmet Serhat Gültekin on 6.08.2023.
//

import UIKit

protocol DeleteButtonProtocol {
    func deleteButtonTapped(indexPath : IndexPath)
}
class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var noteLabel: UILabel!
    
    var cellProtocol : DeleteButtonProtocol?
    var indexPath : IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        
        cellProtocol?.deleteButtonTapped(indexPath : indexPath!)
    }
}
