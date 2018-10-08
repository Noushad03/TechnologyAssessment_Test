//
//  AppDelegate.swift
//  TechnologyAssessmentTest
//
//  Created by Noushad Shah on 10/8/18.
//  Copyright © 2018 Noushad. All rights reserved.
//

import UIKit
import Reachability

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    public let reachability = Reachability()!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        WebConnectConfiguration()
            .baseUrl(baseUrl: API.kBaseUrl)
            .debug(debug: true)
            .timeOut(connectTimeout: 40, readTimeout: 40)
            .config()
        
        self.checkInternetConnection()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //MARK:- checkInternetConnection
    func checkInternetConnection() {
        
        reachability.whenReachable = { reachability in
            // this is called on a background thread, but UI updates must
            // be on the main thread, like this:
            
            DispatchQueue.main.async {
                if reachability.connection == .wifi {
                    print("Reachable via WiFi")
                } else {
                    print("Reachable via Cellular")
                }
                NotificationView.shared.hideNotificationView()
                NotificationCenter.default.post(name: Notification.Name("INTERNET_CONNECTED"), object: nil, userInfo: nil)
                
            }
        }
        reachability.whenUnreachable = { reachability in
            // this is called on a background thread, but UI updates must
            // be on the main thread, like this:
            DispatchQueue.main.async {
                print("Not reachable")
                NotificationView.shared.showViewWithoutDismiss(with: "It seems that you are not connected to any network. Please check your network settings", ofType: NotificationMessageType.NoInternet, andDirection: 1)
                
                NotificationCenter.default.post(name: Notification.Name("NO_INTERNET_CONNECTIVITY"), object: nil, userInfo: nil)
                
            }
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }


}

