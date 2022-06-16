//
//  FileManager+Extensions.swift
//  movies-challenge
//
//  Created by Brayam Mora on 16/06/22.
//

import Foundation

extension FileManager {
    
    static func getJSONObject<T: Decodable> (from fileName: String, bundle: Bundle) -> T? {
        guard let url: URL = bundle.url(forResource: fileName, withExtension: "json"),
              let data: Data = try? Data(contentsOf: url)
        else {
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: data)

    }
}
