//
//  MovieCell.swift
//  Flix
//
//  Created by Miguel Barba on 1/15/19.
//  Copyright © 2019 MBH. All rights reserved.
//

import UIKit

class MovieCell : UITableViewCell {
    
    @IBOutlet weak var MovieImage: UIImageView!
    @IBOutlet weak var MovieLabel: UILabel!
    @IBOutlet weak var MovieSummary: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
