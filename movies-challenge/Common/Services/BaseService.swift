//
//  BaseService.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import Foundation

protocol BaseService {
    func sendRequest<T: Codable>(endpoint: Endpoint, queryParams: [URLQueryItem]?, of: T.Type, method: HTTPMethod, completion: @escaping (Result<T, CustomError>) -> Void)
}

extension BaseService {
    
    func sendRequest<T: Codable>(endpoint: Endpoint, queryParams: [URLQueryItem]? = nil, of: T.Type, method: HTTPMethod, completion: @escaping (Result<T, CustomError>) -> Void) {
        
        let completeUrl = getCompleteUrl(endpoint, queryParams)
        guard let url = completeUrl else {
            completion(.failure(.badUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.name
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, _) in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.noInternetConnection))
                return
            }
            
            guard let data = data else {
                completion(.failure(.responseError))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(.unableToParse))
            }
        }
        task.resume()
    }
    
    private func getCompleteUrl(_ endpoint: Endpoint, _ queryParams: [URLQueryItem]?) -> URL? {
        let finalPath = "\(NetworkConstants.baseUrl)\(endpoint.path)"
        var urlComps = URLComponents(string: finalPath)
        urlComps?.queryItems = queryParams
        return urlComps?.url
    }
}
