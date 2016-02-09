//
//  LearnViewController.swift
//  Read Music
//
//  Created by Lavanya Kannan on 12/24/15.
//  Copyright © 2015 Lavanya Kannan. All rights reserved.
//

import UIKit
import AVFoundation

class LearnViewController: UIViewController {
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var staffImageView: UIImageView!
    var lastDisplayedNote: UIButton!
    var pianoVC: PianoViewController!
    
    var pianoSounds = [String: AVAudioPlayer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        Notes.practicing = false
                
        //setting up touch action for staffImageView
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("resetDisplayedNote:"))
        staffImageView.addGestureRecognizer(tapGestureRecognizer)
        view.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        staffImageView.image = UIImage(named: Notes.learnClef.rawValue.lowercaseString + "-clef-music-staff.png")
        resetDisplayedNote(staffImageView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destVC = segue.destinationViewController as? PianoViewController where segue.identifier == "learnPianoSegue" {
            
            pianoVC = destVC
        }
    }
        
    @IBAction func displayNote(sender: UIButton) {
        pianoVC.resetKeyPressed()
        resetDisplayedNote(staffImageView)
        lastDisplayedNote = sender
        
        if(sender.tag == 1) {
            sender.setImage(UIImage(named: "quarter-note-up-a-blue.png"), forState: .Normal)
        } else if(sender.tag == 2) {
            sender.setImage(UIImage(named: "quarter-note-up-b-blue.png"), forState: .Normal)
        } else if(sender.tag == 3) {
            sender.setImage(UIImage(named: "quarter-note-up-c-blue.png"), forState: .Normal)
        } else if(sender.tag <= 8) {
            sender.setImage(UIImage(named: "quarter-note-up-blue.png"), forState: .Normal)
        } else {
            sender.setImage(UIImage(named: "quarter-note-down-blue.png"), forState: .Normal)
        }
        
        let note = Notes.getNote(sender.tag)
        descLabel.text = "Music note: " + note

        PianoViewController.pianoKeyTitlePressed(note)
    }
    
    func resetDisplayedNote(sender: UIImageView) {
        descLabel.text = "Click on a music note above!"
        
        if (lastDisplayedNote == nil) {
            return
        }

        if(lastDisplayedNote.tag == 1) {
            lastDisplayedNote.setImage(UIImage(named: "quarter-note-up-a.png"), forState: .Normal)
        } else if(lastDisplayedNote.tag == 2) {
            lastDisplayedNote.setImage(UIImage(named: "quarter-note-up-b.png"), forState: .Normal)
        } else if(lastDisplayedNote.tag == 3) {
            lastDisplayedNote.setImage(UIImage(named: "quarter-note-up-c.png"), forState: .Normal)
        } else if(lastDisplayedNote.tag <= 8) {
            lastDisplayedNote.setImage(UIImage(named: "quarter-note-up.png"), forState: .Normal)
        } else {
            lastDisplayedNote.setImage(UIImage(named: "quarter-note-down.png"), forState: .Normal)
        }
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
