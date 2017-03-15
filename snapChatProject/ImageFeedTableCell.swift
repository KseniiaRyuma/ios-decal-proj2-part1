//
//  ImageFeedTableCell.swift
//  snapChatProject
//
//  Created by Kseniia Ryuma on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImageFeedTableCell: UITableViewCell{
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var readIndicator: UIImageView!
    
    @IBOutlet weak var timePosted: UILabel!
    
    var beenRead: Bool? = false
    
}
