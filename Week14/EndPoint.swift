//
//  EndPoint.swift
//  Week14
//
//  Created by Yundong Lee on 2021/12/29.
//

import Foundation


enum EndPoint {
    case signUp
    case login
    case board
    case boardDetail(id:Int)
}

extension EndPoint {
    var url: URL {
        switch self {
        case .signUp:
            return .makeEndPoint("auth/local/register")
        case .login:
            return .makeEndPoint("auth/local")
        case .board:
            return .makeEndPoint("boards")
        case .boardDetail(id: let id):
            return .makeEndPoint("board/\(id)")
        }
    }
}

extension URL {
    static let baseUrl = "http://test.monocoding.com/"
    
    static func makeEndPoint(_ endPoint: String) -> URL {
        return URL(string: URL.baseUrl + endPoint)!
    }
    static var login: URL {
        return makeEndPoint("auth/local")
    }

    static var signUp: URL {
        return makeEndPoint("auth/local/register")
    }

    static var boards: URL {
        return makeEndPoint("boards")
    }

    static func boardsDetail(detail: Int) -> URL {
        return makeEndPoint("boards/\(detail)")
    }
}




extension URLSession {
    
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    @discardableResult
    func dataTask(_ endPoint: URLRequest, handler: @escaping Handler) ->URLSessionDataTask {
        
        let task = dataTask(with: endPoint, completionHandler: handler)
        task.resume()
        return task
    }
    
    static func request<T: Decodable>(_ session: URLSession = .shared, endPoint: URLRequest, completion: @escaping (T?, APIError?) -> Void ) {
        session.dataTask(endPoint) { data, response, error in
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
                    let userData = try decoder.decode(T.self, from: data)
                    completion(userData, nil)
                }catch{
                    completion(nil, .invalidData)
                }
            }
        }
    }
    
}









