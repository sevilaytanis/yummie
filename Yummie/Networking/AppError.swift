//
//  AppError.swift
//  Yummie
//
//  Created by sevilay tanis on 16.04.2023.
//

import Foundation

enum AppError: LocalizedError {
case errorDecoding
case unknownError
case invalidURL
case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "Buhh I have no idea"
        case .invalidURL:
            return "Heyyy!!! Give me a valid Url"
        case .serverError(let error):
            return error
        }
    }
}
