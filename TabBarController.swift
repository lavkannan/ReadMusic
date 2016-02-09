//
//  ViewController.swift
//  Read Music
//
//  Created by Lavanya Kannan on 12/24/15.
//  Copyright © 2015 Lavanya Kannan. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Notes.retrieveStats()
        
        (viewControllers![2] as! SettingsViewController).practiceVC = (viewControllers![1] as! PracticeViewController)
    }
    
}

