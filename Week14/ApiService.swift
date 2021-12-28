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
    static func lotto(_ number: Int, completion: @escaping (Lotto?, APIError?) -> Void) {
        
        let url = URL(string: "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)")!
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
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
                    let userData = try decoder.decode(Lotto.self, from: data)
                    completion(userData, nil)
                }catch{
                    completion(nil, .invalidData)
                }
            }
            
        }.resume()

    }
    static func person(_ text: String, page: Int, completion: @escaping (Person?, APIError?) -> Void) {
        
//        let url = URL(string: "https://api.themoviedb.org/3/search/person?api_key=6e61b7685e790bc1f3aaed7f5dcdb479&language=en-US&query=%ED%98%84%EB%B9%88&page=1&include_adult=false&region=ko-KR")!
        
        let scheme = "https"
        let host = "api.themoviedb.org"
        let path = "/3/search/person"
        
        
        let key = "6e61b7685e790bc1f3aaed7f5dcdb479"
        let language = "ko-KR"
        let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        component.path = path
        component.queryItems = [
            URLQueryItem(name: "api_key", value: key),
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "language", value: language)
        ]
        
        
        
        
        
        URLSession.shared.dataTask(with: component.url!) { data, response, error in
            
            DispatchQueue.main.async {
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
                    let userData = try decoder.decode(Person.self, from: data)
                    completion(userData, nil)
                }catch{
                    completion(nil, .invalidData)
                }
            }
            
        }.resume()

    }
    
    static func board(completion: @escaping (BoardElement?, APIError?) -> Void) {
        let url = URL(string: "http://test.monocoding.com/boards")
        var request = URLRequest(url: url!)
        
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzUsImlhdCI6MTY0MDU2NTg5OCwiZXhwIjoxNjQzMTU3ODk4fQ.Qe1gI1OBlGuEOMqL49wtGi-Knse1f01pJDGCGp5x6PA"
        
        request.setValue("bearer \(token)", forHTTPHeaderField:"authorization")
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do{
                    let decoder = JSONDecoder()
                    let userData = try decoder.decode(BoardElement.self, from: data)
                    completion(userData, nil)
                }catch{
                    
                }
            }
            
        }.resume()
    }
    
    
}
