//
//  TableViewCell.swift
//  TutorialInstagramAccount
//
//  Created by Eirik Madland on 12.07.15.
//  Copyright (c) 2015 Eirik Madland. All rights reserved.
//

import UIKit
import Alamofire
import Haneke

class TableViewCell: UITableViewCell {

    @IBOutlet weak var instaImage: UIImageView!
    @IBOutlet weak var instaLabel: UILabel!
    
    var entry:Alamofire.JSON? {
        didSet {
            self.setupEntry()
        }
    }
    
   override func prepareForReuse() {
        self.instaImage.image = nil
    }
    
    func setupEntry() {
        self.instaLabel.text = self.entry?["caption"]["text"].string
        if let urlString = self.entry?["images"]["standard_resolution"]["url"] {
            let url = NSURL(string: urlString.stringValue)
            self.instaImage.hnk_setImageFromURL(url!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
