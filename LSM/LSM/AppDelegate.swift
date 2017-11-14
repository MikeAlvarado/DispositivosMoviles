//
//  AppDelegate.swift
//  LSM
//
//  Created by Jorge Mendez, Fernando Pompa, and Miguel Alvarado on 10/22/17.
//  Copyright © 2017 ITESM. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setStoryboard()
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
    
    func setStoryboard() {
        let storyboard = grabStoryboard()
        setInitialScreen(storyboard)
    }
    
    func grabStoryboard() -> UIStoryboard{
        let screenHeigth = Int(UIScreen.main.bounds.height)
        var storyboard : UIStoryboard
        
        // altura de los dispositivos
        // iPhone SE -> 568
        // iPhone 8 -> 667
        // iPhone 8 Plus -> 736
        // iPad 9.7 -> 1024
        // iPad 10.5 -> 1112
        // iPad 12.9 -> 1366
        
        switch (screenHeigth) {
        case 480:
            storyboard = UIStoryboard(name: "Main iPhone 4", bundle: nil)
            break
        case 568:
            storyboard = UIStoryboard(name: "Main iPhone SE", bundle: nil)
            break
        case 667:
            storyboard = UIStoryboard(name: "Main iPhone 8", bundle: nil)
            break
        case 736:
            storyboard = UIStoryboard(name: "Main iPhone 8 Plus", bundle: nil)
            break
        case 1024:
            storyboard = UIStoryboard(name: "Main iPad Pro 9", bundle: nil)
            break
        case 1112:
            storyboard = UIStoryboard(name: "Main iPad Pro 10", bundle: nil)
            break
        case 1366:
            storyboard = UIStoryboard(name: "Main iPad Pro 12", bundle: nil)
            break
        default:
            storyboard = UIStoryboard(name: "Main", bundle: nil)
            break
        }
        
        return storyboard;
    }
    
    func setInitialScreen(_ storyboard : UIStoryboard) {
        var initViewController : UIViewController
        initViewController = storyboard.instantiateViewController(withIdentifier: "First")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = initViewController
        window?.makeKeyAndVisible()
    }


}

