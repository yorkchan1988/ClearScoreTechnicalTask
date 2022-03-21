//
//  APIManager.swift
//  ClearScoreIOSTechnicalTask
//
//  Created by YORK CHAN on 12/3/2022.
//

import Foundation

protocol NetworkManagerProtocol {
    
    func requestData(apiPath: String, httpMethod: HTTPMethod, parameters:[String:String], completionHandler : @escaping (Result<Data, NetworkError>) -> ())
}

class NetworkManager: NetworkManagerProtocol {
    
    private let timeoutIntervalForRequest = 30
    private let timeoutIntervalForResource = 30
    
    static let shared = NetworkManager(baseURLString: getBaseUrlString())

    private let baseURLString: String?
    private let session: URLSession

    private init(baseURLString: String?) {
        self.baseURLString = baseURLString
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = TimeInterval(timeoutIntervalForRequest)
        configuration.timeoutIntervalForResource = TimeInterval(timeoutIntervalForResource)
        session = URLSession(configuration: configuration)
    }
    
    // MARK: API Request
    func requestData(apiPath: String, httpMethod: HTTPMethod, parameters:[String:String], completionHandler : @escaping (Result<Data, NetworkError>) -> ()) {
            
        guard let baseURLString = baseURLString, var components = URLComponents(string: baseURLString+apiPath) else {
            completionHandler(.failure(NetworkError.clientError))
            return
        }
        
        if httpMethod == .get {
            constructGetUrl(parameters: parameters, components: &components)
        }
        
        guard let url = components.url else {
            completionHandler(.failure(NetworkError.clientError))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
            
        if httpMethod == .post {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            } catch {
                completionHandler(.failure(NetworkError.clientError))
            }
        }
        
        print(String(format: "%@ - url: %@", #function, url.absoluteString))
        let task = session.dataTask(with: request as URLRequest) { data, response, error in
            
            guard let data = data else {
                completionHandler(.failure(NetworkError.serverError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completionHandler(.failure(NetworkError.serverError))
                return
            }
            
            guard let mime = response.mimeType, mime == "application/json" else {
                completionHandler(.failure(NetworkError.serverError))
                return
            }
            
            print(String(format: "%@ - url: %@ -- success", #function, url.absoluteString))
            completionHandler(.success(data))
            
        }
        task.resume()
    }
    
    func constructGetUrl(parameters:[String:String], components: inout URLComponents) {
        components.queryItems = []
        for (key, value) in parameters {
            components.queryItems?.append(URLQueryItem(name: key, value: value))
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
    }
}
