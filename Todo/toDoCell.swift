//
//  toDoCell.swift
//  Todo
//
//  Created by R Unnikrishnan on 16/08/24.
//

import UIKit

class toDoCell: UITableViewCell {
    @IBOutlet weak var todoListLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
