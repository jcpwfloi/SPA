//
//  TableViewCell.swift
//  SPA
//
//  Created by Bokai Li on 10/7/20.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    
    func setUser(user:Username){
        label1.text = user.title
        
    }

}
