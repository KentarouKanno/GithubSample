//
//  GithubClient.swift
//  GithubSample
//
//  Created by Kentarou on 2017/02/13.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import Foundation

class GithubClient {
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        return session
    }()
    
    func send<Request: GithubRequest>(request: Request, completion: @escaping (Result<Request.Response, GithubClientError>) -> Void) {
        let urlRequest = request.buildURLRequest()
        let task = session.dataTask(with: urlRequest)
        { data, response, error in
            
            switch (data, response, error) {
            case (_, _, let error?):
                completion(Result(error: .connectionError(error)))
            case (let data?, let response?, _):
                
                do {
                    
                    let response = try request.response(from: data, urlResponse: response)
                    completion(Result(value: response))
                } catch let error as GithubAPIError {
                    completion(Result(error: .apiError(error)))
                } catch {
                    completion(Result(error: .responseParseError(error)))
                }
                
            default:
                fatalError("invalid response combination \(data), \(response), \(error)")
            }
            
        }
        task.resume()
    }
}
