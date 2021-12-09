//
//  DogError.swift
//  RandomDog
//
//  Created by Ethan Perkins on 12/1/21.
//

import Foundation

enum DogError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    
    var errorDescription: String? {
        switch self {
        
        case .invalidURL:
            return "Internal error. Please update Dog Randomizer or contact support."
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "The server responded with no data."
        case .unableToDecode:
            return "The server responded with bad data."
        }
    }
}
