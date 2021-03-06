//
//  SettingsViewController.swift
//  Read Music
//
//  Created by Lavanya Kannan on 1/6/16.
//  Copyright © 2016 Lavanya Kannan. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

    @IBOutlet weak var learnClefControl: UISegmentedControl!
    @IBOutlet weak var practiceClefControl: UISegmentedControl!
    @IBOutlet weak var practiceWithControl: UISegmentedControl!
    @IBOutlet weak var practiceTimeControl: UISegmentedControl!
    
    var practiceVC: PracticeViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func learnClefChanged(sender: UISegmentedControl) {
        
        Notes.changeLearnClef()
        Notes.updateSettingChange()
    }
    
    @IBAction func practiceClefChanged(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
            
        case 0:
            Notes.practiceClef = Notes.Clef.Treble
            
        case 1:
            Notes.practiceClef = Notes.Clef.Base
        
        case 2:
            Notes.practiceClef = Notes.Clef.Both
            
        default:
            break;
            
        }
        Notes.updateSettingChange()
    }
    
    @IBAction func practiceWithChanged(sender: UISegmentedControl) {
        
        Notes.letterPractice = !Notes.letterPractice
        practiceVC.switchPractice()
        Notes.updateSettingChange()
    }
    
    @IBAction func practiceTimeChanged(sender: UISegmentedControl) {
        
        Notes.practiceTime = (Double(sender.selectedSegmentIndex) + 1)*20
        Notes.updateSettingChange()
    }
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
