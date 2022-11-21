//
//  NetworkManager.swift
//  GetFavReposFromGithub
//
//  Created by NewMac on 11/20/22.
//

import Foundation

enum NetworkError: Error {
    case url
    case data
    case parse
    case network
}

enum HTTPMethod: String {
    case get = "GET"
}

class NetworkManager {
    func request<T: Decodable>(urlString: String, method: HTTPMethod, success: @escaping (T) -> (), failure: @escaping (NetworkError) -> ()) {
        guard let url = URL.init(string: urlString) else {
            failure(.url)
            return
        }
        
        var urlRequest = URLRequest.init(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let request = URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            if error != nil {
                failure(.network)
            }
            
            guard let data = data else {
                failure(.data)
                return
            }
            
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                success(model)
            } catch {
                failure(.parse)
            }
        }.resume()
    }
}


/*
guard let url = URL.init(string: "https://api.github.com/search/repositories?q=language=+sort:stars") else {
    print("URL could not found")
    return
}

var urlRequest = URLRequest.init(url: url)
urlRequest.httpMethod = "GET"

let request = URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, response, error) in
    if error != nil {
        print(error)
    }
    
    guard let data = data else {
        print("There is no data")
        return
    }
    
    do {
        let model = try JSONDecoder().decode(GetReposResponse.self, from: data)
        print(model)
    } catch {
        print("Parsing error")
    }
}.resume()
*/
