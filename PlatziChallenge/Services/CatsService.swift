//
//  CatsService.swift
//  PlatziChallenge
//
//  Created by Miguel Aquino on 20/12/20.
//

import UIKit

class CatsService {
    
    //MARK: - Properties
    static let shared = CatsService()
    private let apiKey = PlistService.getPlistKey(key: .apiKey)
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    //MARK:- Services Implementation
    func getCats(completion: @escaping (Result<[Cat], APIError> ) -> Void) {
        
        guard let url = URL(string: ApiURL.catsURL) else { return }
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return }
        
        let queryItem = [URLQueryItem(name: Keys.API_KEY,  value: apiKey)]
        urlComponents.queryItems = queryItem
        
        guard let finalURL = urlComponents.url else { return }
        
        
        URLSession.shared.dataTask(with: finalURL, completionHandler: {( data, response ,error) in
            if let _ = error {
                completion(.failure(.unknownError))
            }
            
            guard let data = data else { return }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { completion(.failure(.invalidResponse)); return }
            
            
            do{
                let movieResponse = try JSONDecoder().decode([Cat].self, from: data)
                completion(.success(movieResponse))
            } catch {
                completion(.failure(.invalidData))
            }
        }).resume()
    }
    
    func getCatImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let self = self,
                  error == nil,
                  let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data,
                  let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}

