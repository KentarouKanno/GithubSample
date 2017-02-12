//
//  JSONDecodable.swift
//  GithubSample
//
//  Created by Kentarou on 2017/02/12.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import Foundation

protocol JSONDecodable {
    init(json: Any) throws
}
