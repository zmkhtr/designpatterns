//
//  DetailViewController.swift
//  designpatterns
//
//  Created by Azam Mukhtar on 10/12/20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var detailView: DetailView!
    
    var meme : Meme?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let meme = meme {
            detailView.updateDetail(meme: meme)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
