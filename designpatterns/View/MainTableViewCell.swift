//
//  MainTableViewCell.swift
//  designpatterns
//
//  Created by Azam Mukhtar on 09/12/20.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageMainCell: UIImageView!
    @IBOutlet weak var authorMainCell: UILabel!
    
    func setupCellFor(data: Meme){
        imageMainCell.setFromURL(from: String(data.preview[2]))
        authorMainCell.text = data.title
    }
    
    
}
