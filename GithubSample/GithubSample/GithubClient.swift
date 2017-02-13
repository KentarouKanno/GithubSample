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
    
    func send<Request: GithubRequest>(request: Request, completion: (Result<Request.Response, GithubClientError>) -> Void) {
        let urlRequest = request.buildURLRequest()
        let task = session.dataTask(with: urlRequest)
        { data, response, error in
            
        }
        task.resume()
    }
}
