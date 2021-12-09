//
//  DogController.swift
//  RandomDog
//
//  Created by Ethan Perkins on 12/1/21.
//

import UIKit

class DogController {
    
    
    
    static func fetchDog(completion: @escaping (Result <Dog, DogError>) -> Void ) {
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else { return completion(.failure(.invalidURL)) }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
            
            do {
                let topLevelObject = try JSONDecoder().decode(Dog.self, from: data)
                return completion(.success(topLevelObject))
            } catch {
                print(error, error.localizedDescription)
                
            }
            
        }.resume()
    }
    
    static func fetchImage(for dog: Dog, completion: @escaping (Result <UIImage, DogError>) -> Void) {
        guard let url = URL(string: dog.message) else { return completion(.failure(.invalidURL)) }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
            
            guard let thumbnail = UIImage(data: data) else { return completion(.failure(.unableToDecode)) }
            
            return completion(.success(thumbnail))
            
        }.resume()
        
        
    }
                            
                            
}
