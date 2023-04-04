//
//  ApiManager.swift
//  NewsAppM4
//
//  Created by Nazar Kydyraliev on 30/3/23.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    let urlString = "https://reqres.in/api/users?page=2"
    
    func getData(completion: @escaping (Result<ProfileData, Error>) -> Void) {
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else {return}
            
            do {
                let newsData = try JSONDecoder().decode(ProfileData.self, from: data)
                completion(.success(newsData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
