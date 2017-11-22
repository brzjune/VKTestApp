//
//  ViewController.swift
//  VKTestApp
//
//  Created by brzjune on 11/22/17.
//  Copyright © 2017 brzjune. All rights reserved.
//

import UIKit
import VK_ios_sdk

let ACCESS_TOKEN = "access_token"
let APP_ID = "6261037"
let SEGUE_AUTHORIZED = "AUTHORIZED"
let SCOPE = ["wall"]

class ViewController: UIViewController, VKSdkDelegate, VKSdkUIDelegate {
    
    @IBOutlet weak var authState: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let sdkInstance = VKSdk.initialize(withAppId: APP_ID)
        sdkInstance?.register(self)
        sdkInstance?.uiDelegate = self
        
        VKSdk.wakeUpSession(SCOPE) { (state: VKAuthorizationState, error: Error?) in
            if state == .authorized {
                self.authState.text = "authorized"
                self.startWork()
            } else {
                self.authState.text = "no authorized"
            }
        }
    }
    
    // MARK: Actions
    
    @IBAction func onAuth(_ sender: UIButton) {
        VKSdk.authorize(SCOPE)
    }
    
    func startWork() {
        performSegue(withIdentifier: SEGUE_AUTHORIZED, sender: self)
    }
    // MARK: VKSdkDelegate, VKSdkUIDelegate
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        if (result.token != nil) {
            self.authState.text = "authorized"
            
            let vkRequest = VKApi.request(withMethod: "wall.get", andParameters: [VK_API_OWNER_ID: APP_ID, VK_API_USER_ID: VKSdk.accessToken().userId,VK_API_COUNT: 50, VK_API_ACCESS_TOKEN: VKSdk.accessToken() ])
            
            vkRequest?.execute(resultBlock: { (_ response: VKResponse<VKApiObject>?) -> Void in
                print("Json result: \(response!.json)")
            }, errorBlock: { (_ error: Error?) -> Void in
                print("VK error: \(error!)")
            })
            
            startWork()
        } else {
            self.authState.text = "not authorized"
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        self.navigationController?.topViewController?.present(controller, animated: true, completion: nil)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        let vc = VKCaptchaViewController.captchaControllerWithError(captchaError)
        vc?.present(in: self.navigationController?.topViewController)
    }
    
    
}

