//
//  ViewController.swift
//  GithubSample
//
//  Created by Kentarou on 2017/02/12.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let client = GithubClient()
        let request = GithubAPI.SearchRepositories(keyword: "swift")
        
        client.send(request: request) { result in
            
            switch result {
            case .success(let response):
                // 成功
                for item in response.items {
                    // リポジトリの所有者と名前を出力
                    print(item.owner.login + "/" + item.name)
                }
                
            case .failure(.connectionError(let error)):
                // 通信に失敗した場合
                print(error)
                
            case .failure(.responseParseError(let error)):
                // レスポンスの解釈に失敗した場合
                print(error)
                
            case .failure(.apiError(let error)):
                // エラーレスポンスを受け取った場合
                // errorの型はGithubAPIErrorとなる
                print(error)
            }
        }
    }
}

