//
//  ArticleListingTableCell.swift
//  TechnologyAssessmentTest
//
//  Created by clickapps on 10/8/18.
//  Copyright © 2018 Noushad. All rights reserved.
//

import UIKit

class ArticleListingTableCell: UITableViewCell {
    
    @IBOutlet weak var imgVw:UIImageView!
    
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblSubtitile:UILabel!
    @IBOutlet weak var lblDate:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.imgVw.layer.cornerRadius = 25.0
        self.imgVw.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
