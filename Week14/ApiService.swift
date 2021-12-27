//
//  ApiService.swift
//  Week14
//
//  Created by Yundong Lee on 2021/12/27.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case noData
    case failed
    case invalidData
}


class ApiService {
    
    static func register(username: String, email: String, password: String, completion: @escaping (User?, APIError?) -> Void) {
        
        let url = URL(string: "http://test.monocoding.com/auth/local/register")!
        var request = URLRequest(url: url)
        request.httpBody = "username=\(username)&password=\(password)&email=\(email)".data(using: .utf8,allowLossyConversion: false)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error)
                completion(nil, .invalidResponse)
                return
            }
            
            guard let data = data else {
                completion(nil, .invalidData)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(nil, .invalidResponse)
                return
            }
            
            guard response.statusCode == 200 else {
                completion(nil, .failed)
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let userData = try decoder.decode(User.self, from: data)
                print(userData)
                completion(userData, nil)
            }catch{
                completion(nil, .invalidData)
            }
            
            
        }.resume()
        

    }
    
    static func login(id: String, pass: String, completion: @escaping (User?, APIError?) -> Void) {
        
        let url = URL(string: "http://test.monocoding.com/auth/local")!
        
        
        var request = URLRequest(url: url)
        request.httpBody = "identifier=\(id)&password=\(pass)".data(using: .utf8,allowLossyConversion: false)
        request.httpMethod = "POST"
        
        // String -> data, dic -> JSON serialziation , codable
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else{
                completion(nil, .failed)
                return

            }
            guard let data = data else {
                completion(nil, .noData)
                return
            }

            guard let response = response as? HTTPURLResponse else {
                completion(nil, .invalidResponse)
                return
            }

            guard response.statusCode == 200 else {
                completion(nil, .failed)
                return
            }

            do{
                let decoder = JSONDecoder()
                let userData = try decoder.decode(User.self, from: data)
                completion(userData, nil)
            }catch{
                completion(nil, .invalidData)
            }
        }.resume()

    }
}
