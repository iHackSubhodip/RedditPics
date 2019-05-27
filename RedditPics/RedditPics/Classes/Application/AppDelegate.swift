//
//  AppDelegate.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 27/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        setUpRootView()
        setUpNavigationController()
        return true
    }
    
    func setUpRootView() {
        let networkWebService = NetworkingWebService()
        let redditInteractor = RedditInteractor(webService: networkWebService)
        let rootViewController = RedditPicsViewController()
        redditInteractor.viewModelInputHolder = rootViewController
        rootViewController.controllerOutput = redditInteractor
        let navigationController = CustomNavigationController(rootViewController: rootViewController)
        window?.rootViewController = navigationController
    }
    
    func setUpNavigationController(){
        UINavigationBar.appearance().tintColor = UIColor.rgb(red: 80, green: 227, blue: 194, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.rgb(red: 74, green: 74, blue: 74, alpha: 1.0), NSAttributedString.Key.font : UIFont.semiBold(17.0)]
    }

}

