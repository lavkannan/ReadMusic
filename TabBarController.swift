//
//  ViewController.swift
//  Read Music
//
//  Created by Lavanya Kannan on 12/24/15.
//  Copyright © 2015 Lavanya Kannan. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
//    var learnVC: LearnViewController!
//    var practiceVC: PracticeViewController!
    
    //    @IBOutlet weak var userDefaultTextField: UITextField!
    
    //    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //        view.backgroundColor = UIColor(patternImage: UIImage(named: "Background_trial")!)
        
        //        if let str = defaults.objectForKey("TestString") {
        //            userDefaultTextField.text = str as? String
        //        }
        //
        //        print("default value ", defaults.objectForKey("TestString"))
        
        Notes.retrieveStats()
        
        (viewControllers![2] as! SettingsViewController).practiceVC = (viewControllers![1] as! PracticeViewController)
    }
    
    
    //    @IBAction func buttonPressed(sender: AnyObject) {
    //        defaults.setObject(userDefaultTextField.text, forKey: "TestString")
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

