//
//  Result.swift
//  GithubSample
//
//  Created by Kentarou on 2017/02/13.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import Foundation

enum Result<T, Error: Swift.Error> {
    
    case success(T)
    case failure(Error)
    
    init(value: T) {
        self = .success(value)
    }
    
    init(error: Error) {
        self = .failure(error)
    }
}
