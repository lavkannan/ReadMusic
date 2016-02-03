//
//  PracticeViewController.swift
//  Read Music
//
//  Created by Lavanya Kannan on 12/24/15.
//  Copyright © 2015 Lavanya Kannan. All rights reserved.
//

import UIKit

class PracticeViewController: UIViewController {
    
    @IBOutlet weak var randImageView: UIImageView!
    @IBOutlet weak var guessResultLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
//    @IBOutlet weak var bestTimeLabel: UILabel!
    @IBOutlet weak var beginButton: UIButton!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var containerView: UIView!
    var pianoVC: PianoViewController!
    
    static var guessedPianoKey = ""
    var startTime = NSTimeInterval()
    var timer = NSTimer()
//    var lastTime = 0.0
    var bestTime = Double.infinity
    var numCorrect = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        containerView.hidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
        stopTimer()
        beginButton.hidden = false
        Notes.practicing = false
        guessResultLabel.text = ""
        timeLabel.text = ""
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destVC = segue.destinationViewController as? PianoViewController where segue.identifier == "practicePianoSegue" {
            
            pianoVC = destVC
            pianoVC.p = self
        }
    }
    
//    @IBAction func changeClef(sender: UIButton) {
//        
//        sender.setTitle(Notes.practiceClef.rawValue + " Clef", forState: UIControlState.Normal)
//        Notes.changePracticeClef()
//        displayRandImage()
//    }
    
    //implement both clefs
    @IBAction func startButtonPressed(sender: UIButton) {
        
        startTimer()
        displayRandImage()
        Notes.practicing = true
        sender.hidden = true
        guessResultLabel.text = ""
        if(!Notes.letterPractice) {
            pianoVC.resetKeyPressed()
        }
    }
    
    func displayRandImage() {
        
        let name = Notes.getPracticeRandom() + "-note-" + Notes.randClef.rawValue.lowercaseString
        randImageView.image = UIImage(named: name)
//        startTimer()
    }
    
    @IBAction func processGuess(sender: UIButton) {
        
        if(beginButton.hidden == false || Notes.practicing == false) {
            return
        }
        
        if(Notes.checkGuess(sender.currentTitle!)) {
            
            guessResultLabel.text = "Correct!"
//            stopTimer()
//            updateBestTime()
            numCorrect++
            Notes.incrementTotalCorrect()
            
//            beginButton.hidden = false
//            Notes.practicing = false
            displayRandImage()
            
        } else {
            guessResultLabel.text = "Incorrect. Try again!"
            Notes.incrementTotalMistakes()
        }
        
    }
        
    func startTimer() {
        if (!timer.valid) {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "updateTime", userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
        }
    }
    
    func stopTimer() {
        timer.invalidate()
        
    }
    
//    func updateBestTime() {
//        
//        if(lastTime < bestTime) {
//            bestTime = lastTime
//            
//            updateTimeLabel(bestTimeLabel, elapsedTime: bestTime)
//        }
//    }
    
    func updateTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        let elapsedTime: NSTimeInterval = currentTime - startTime
//        lastTime = elapsedTime
        
        let labelTime = Notes.practiceTime - elapsedTime
        
        if(labelTime <= 0) {
            stopTimer()
            Notes.practicing = false
            beginButton.hidden = false
            timeLabel.text = "00:00"
            
            guessResultLabel.text = "You guessed " + String(numCorrect) + " correct!"
            Notes.updateBestRun(numCorrect)
            numCorrect = 0
            
        } else {
            updateTimeLabel(timeLabel, elapsedTime: labelTime)
        }
    }
    
    func updateTimeLabel(label: UILabel, var elapsedTime: NSTimeInterval) {
        
        //calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        let fraction = UInt8(elapsedTime * 100)
        
        //add the leading zero for seconds and millseconds and store them as string constants
        let strSeconds = String(format: "%02d", seconds)
        let strFraction = String(format: "%02d", fraction)
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        var time = "\(strSeconds):\(strFraction)"
        if(minutes != 0) {
            let strMinutes = String(format: "%d", minutes)
            time = "\(strMinutes):" + time
        }
        label.text = time
    }
    
    func switchPractice() {
        stackView.hidden = !stackView.hidden
        containerView.hidden = !containerView.hidden
//        Notes.letterPractice = !Notes.letterPractice
        Notes.practicing = false
        
//        if(Notes.letterPractice) {
//            sender.setTitle("Practice With Piano", forState: .Normal)
//            pianoVC.resetKeyPressed()
//            
//        } else {
//            sender.setTitle("Practice With Letters", forState: .Normal)
//        }
        stopTimer()
        
        guessResultLabel.text = ""
        beginButton.hidden = false
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
