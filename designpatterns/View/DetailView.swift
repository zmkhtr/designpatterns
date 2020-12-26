//
//  MainViewController.swift
//  designpatterns
//
//  Created by Azam Mukhtar on 09/12/20.
//

import UIKit

class DetailView: UIView {
    
    @IBOutlet weak var authorDetail: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    

    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateDetail(meme : Meme) {
        authorDetail.text = meme.title
        imageDetail.setFromURL(from: meme.url)
    }
}
