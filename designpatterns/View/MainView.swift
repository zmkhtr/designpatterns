//
//  MainView.swift
//  designpatterns
//
//  Created by Azam Mukhtar on 09/12/20.
//

import UIKit

class MainView : UIView {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func updateView(){
        tableView.reloadData()
    }
}
