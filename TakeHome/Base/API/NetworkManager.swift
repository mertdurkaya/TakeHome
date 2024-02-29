//
//  NetworkManager.swift
//  TakeHome
//
//  Created by Mert Durkaya on 29/02/2024.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {
        
    }
    
    func request<T: Codable>(_ absoluteURL: String, type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: absoluteURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        guard let url = URL(string: absoluteURL) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let request = URLRequest(url: url)
        
        let dataTask: Void = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.custom(error: error)))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200...300) ~= response.statusCode else {
                      let statusCode = (response as? HTTPURLResponse)?.statusCode
                      completion(.failure(.invalidStatusCode))
                      return
                  }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let res = try decoder.decode(T.self, from: data)
                completion(.success(res))
            } catch {
                completion(.failure(.failedtoDecode(error: error)))
            }
        }.resume()
    }
}


extension NetworkManager {
    enum NetworkError: Error {
        case invalidURL
        case custom(error: Error)
        case invalidStatusCode
        case invalidData
        case failedtoDecode(error: Error)
    }
}
