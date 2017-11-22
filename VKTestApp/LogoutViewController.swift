//
//  LogoutViewController.swift
//  VKTestApp
//
//  Created by brzjune on 11/23/17.
//  Copyright © 2017 brzjune. All rights reserved.
//

import UIKit
import VK_ios_sdk

class LogoutViewController: UIViewController {
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.view.backgroundColor = UIColor.white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Logout", style: UIBarButtonItemStyle.done, target: self, action: #selector(logout))
        
        self.infoLabel.text = VKSdk.accessToken().userId
    }
    
    @objc func logout(sender: Any) {
        VKSdk.forceLogout()
        self.navigationController?.popToRootViewController(animated: true)
    }
}
