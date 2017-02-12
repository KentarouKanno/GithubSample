//
//  GithubAPI.swift
//  GithubSample
//
//  Created by Kentarou on 2017/02/12.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import Foundation

final class GithubAPI {
    
    // Repositories
    struct SearchRepositories: GithubRequest {
        
        let keyword: String
        
        // GithubRequestが要求する連想型
        typealias Response = SearchResponse<Repository>
        
        
        var path: String {
            return "/search/repositories"
        }
        var method: HTTPMethod {
            return .get
        }
        var parameters: Any? {
            return ["q": keyword]
        }
    }
    
    // Users
    struct SearchUsers: GithubRequest {
        
        let keyword: String
        
        // GithubRequestが要求する連想型
        typealias Response = SearchResponse<User>
        
        
        var path: String {
            return "/search/users"
        }
        var method: HTTPMethod {
            return .get
        }
        var parameters: Any? {
            return ["q": keyword]
        }
    }
}
