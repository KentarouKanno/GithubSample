//
//  AppDelegate.swift
//  GithubSample
//
//  Created by Kentarou on 2017/02/12.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }
}


// APIのレスポンスヘッダやボディを確認する
// curl -i 'https://api.github.com/search/repositories?q=swift&per_page=1'
