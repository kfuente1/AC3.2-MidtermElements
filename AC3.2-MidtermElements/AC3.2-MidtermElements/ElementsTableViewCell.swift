//
//  ElementsTableViewCell.swift
//  AC3.2-MidtermElements
//
//  Created by Karen Fuentes on 12/8/16.
//  Copyright © 2016 Karen Fuentes. All rights reserved.
//

import UIKit

class ElementsTableViewCell: UITableViewCell {

    @IBOutlet weak var elementInfo: UILabel!
    @IBOutlet weak var elementImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
