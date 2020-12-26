//
//  ViewController.swift
//  designpatterns
//
//  Created by Azam Mukhtar on 09/12/20.
//

import UIKit

class ViewController: UIViewController {
    
//    var apiService = ApiService() // MVC
  
    @IBOutlet var mainView: MainView!
    private var mainViewModel = MainViewModel()
    
    
// MVC Code
//    var memes : [Meme] = [] {
//        didSet {
//            mainView.updateView()
//        }
//    }
    
    var angka : Int = 0 {
        didSet {
            angka = angka + 2;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // getImagesData() // MVC
        loadMemes()
        setTitle()
    }
    
    private func setTitle(){
        self.title = "Memes"
    }
    
    private func loadMemes(){
        mainViewModel.fetchMemes { [weak self] in
            self?.mainView.updateView()
            self?.mainView.tableView.dataSource = self
        }
    }
// MVC Code
//    private func getImagesData(){
//        apiService.getMemesData { (result) in
//            switch result {
//            case .success(let data) :
//                self.memes = data.memes
//            case .failure(let error):
//                print("Error \(error)")
//            }
//        }
//    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return memes.count //MVC
        return mainViewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        
        let meme = mainViewModel.cellForRowAt(indexPath: indexPath)
        cell.setupCellFor(data: meme)
        // cell.setupCellFor(data: memes[indexpath.row]) // MVC
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meme = mainViewModel.cellForRowAt(indexPath: indexPath)
        performSegue(withIdentifier: "toDetail", sender: meme)
//        performSegue(withIdentifier: "toDetail", sender: memes[indexPath.row]) // MVC
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.meme = sender as? Meme
        }
    }
}


