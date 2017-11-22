//
//  AppDelegate.swift
//  VKTestApp
//
//  Created by brzjune on 11/22/17.
//  Copyright © 2017 brzjune. All rights reserved.
//

import UIKit
import VK_ios_sdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        let sdkInstance = VKSdk.initialize(withAppId: VK_APP_ID)
//        sdkInstance?.register(self)
//        sdkInstance?.uiDelegate = self
//
//        VKSdk.wakeUpSession(scope) { (state, error) in
//            if state == .authorized {
//                print("User is authorized!")
//            } else if state == .initialized {
//                print("SDK is ready for work!")
//                VKSdk.authorize(self.scope)
//            } else if error != nil {
//                print(error!)
//            }
//        }
//        
//        let vkRequest = VKApi.request(withMethod: "users.get", andParameters: [VK_API_OWNER_ID: VK_APP_ID, VK_API_USER_IDS: ["id58827976", "brzjune"]])
//
//        vkRequest?.execute(resultBlock: { (_ response: VKResponse<VKApiObject>?) -> Void in
//            print("Kson result: \(response!.json)")
//        }, errorBlock: { (_ error: Error?) -> Void in
//            print("VK error: \(error!)")
//        })
//
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        VKSdk.processOpen(url, fromApplication: sourceApplication!)
        return true
    }
}

