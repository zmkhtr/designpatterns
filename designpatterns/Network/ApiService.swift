//
//  ApiService.swift
//  designpatterns
//
//  Created by Azam Mukhtar on 10/12/20.
//

import Foundation

class ApiService {
    private var dataTask: URLSessionDataTask?
    
    func getMemesData(completion: @escaping (Result<MemesModel, Error>) -> Void) {
        guard let imagesListURL = URL(string: "https://meme-api.herokuapp.com/gimme/dankmemes/10") else {return}
        
        dataTask = URLSession.shared.dataTask(with: imagesListURL) { (data, response, error) in
        
            if let error = error {
                completion(.failure(error))
                print("Error fetching data : \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Empty response")
                return
            }
            
            print("Response code : \(response.statusCode)")
            
            guard let data = data else {
                print("Empty data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MemesModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        
        dataTask?.resume()
    }
}
