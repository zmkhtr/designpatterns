//
//  MainViewModel.swift
//  designpatterns
//
//  Created by Azam Mukhtar on 10/12/20.
//

import Foundation

class MainViewModel {
    private var apiService = ApiService()
    var memes = [Meme]()
    
    func fetchMemes(completion: @escaping () -> ()) {
        apiService.getMemesData { (result) in
            switch result {
            case .success(let memes) :
                self.memes = memes.memes
                completion()
            case .failure(let error):
                print("Error processing json data \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if (memes.count != 0) {
            return memes.count
        }
        return 0
    }
    
    func cellForRowAt(indexPath : IndexPath) -> Meme {
        return memes[indexPath.row] 
    }
}
