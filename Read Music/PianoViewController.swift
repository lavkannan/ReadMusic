//
//  PianoViewController.swift
//  Read Music
//
//  Created by Lavanya Kannan on 12/28/15.
//  Copyright © 2015 Lavanya Kannan. All rights reserved.
//

import UIKit
import AVFoundation

class PianoViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
//    var scrollView = UIScrollView()
//    var contentView = UIView()
    
    static var pianoSounds = [String: AVAudioPlayer]()
    var lastButtonPressed: UIButton!
    
    var p = PracticeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let pianoWidth = 30*45
//        view.frame = CGRect(x: 0, y: 0, width: pianoWidth, height: 111)
//        view.backgroundColor = UIColor.redColor()
//        
//        scrollView.frame = view.frame
        scrollView.contentSize.width = CGFloat(pianoWidth) //1197
//        scrollView.showsVerticalScrollIndicator = false
//        scrollView.pagingEnabled = true
//        scrollView.directionalLockEnabled = true
//        scrollView.multipleTouchEnabled = true
////        scrollView.backgroundColor = UIColor.redColor()
//        view.addSubview(scrollView)
//        
//        contentView.frame = view.frame
//        scrollView.addSubview(contentView)
        
        let keysStack = UIStackView(frame: contentView.bounds)
        contentView.addSubview(keysStack)
        
        let keyNotes = ["A","B","C","D","E","F","G"]
        var ind = 0
        var n = 2
        let stackRect = keysStack.bounds
        var lastX = stackRect.minX
        
        while (ind != 2 || n != 6) {

            //adding white keys
            let nextNote = keyNotes[ind]
            let whitePianoKey = UIButton(frame: CGRect(x: lastX, y: stackRect.minY, width: 45, height: stackRect.height))
            whitePianoKey.setBackgroundImage(UIImage(named: "piano-key-background"), forState: .Normal)
            whitePianoKey.setTitle(nextNote + String(n), forState: .Normal)
            whitePianoKey.setTitleColor(UIColor.blackColor(), forState: .Normal)
            whitePianoKey.contentVerticalAlignment = .Bottom
            whitePianoKey.addTarget(self, action: "pianoKeyPressed:", forControlEvents: .TouchUpInside)
            keysStack.addSubview(whitePianoKey)
            
            if(nextNote != "B" && nextNote != "E") {
                //adding black keys
                let blackPianoKey = UIButton(frame: CGRect(x: lastX+29, y: stackRect.minY, width: 32, height: stackRect.height/2 ))
                blackPianoKey.setBackgroundImage(UIImage(named: "piano-key-black-background"), forState: .Normal)
                blackPianoKey.setTitle(nextNote + "#", forState: .Normal)
                blackPianoKey.tag = n*10
//                blackPianoKey.titleLabel?.minimumScaleFactor = 0.4
//                blackPianoKey.titleLabel?.adjustsFontSizeToFitWidth = true
                blackPianoKey.addTarget(self, action: "pianoKeyPressed:", forControlEvents: .TouchUpInside)
                scrollView.addSubview(blackPianoKey)
            }
            
            lastX += 45
            ind++
            if (ind > 6) {
                ind = 0
                n++;
            }
        }
        
        contentView.layer.borderColor = UIColor.blackColor().CGColor
        contentView.layer.borderWidth = 8
        contentView.layer.shadowColor = UIColor.grayColor().CGColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = CGSizeZero
        contentView.layer.shadowRadius = 10
        
        PianoViewController.setUpNoteSounds()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    static func setUpNoteSounds() {
        var a2Sound, aSharp2Sound, b2Sound, c2Sound, cSharp2Sound, d2Sound, dSharp2Sound, e2Sound, f2Sound, fSharp2Sound, g2Sound, gSharp2Sound, a3Sound, aSharp3Sound, b3Sound, c3Sound, cSharp3Sound, d3Sound, dSharp3Sound, e3Sound, f3Sound, fSharp3Sound, g3Sound, gSharp3Sound, a4Sound, aSharp4Sound, b4Sound, c4Sound, cSharp4Sound, d4Sound, dSharp4Sound, e4Sound, f4Sound, fSharp4Sound, g4Sound, gSharp4Sound, a5Sound, aSharp5Sound, b5Sound, c5Sound, cSharp5Sound, d5Sound, dSharp5Sound, e5Sound, f5Sound, fSharp5Sound, g5Sound, gSharp5Sound, a6Sound, aSharp6Sound, b6Sound: AVAudioPlayer!
        
        do {
            a2Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("a2Sound.wav", ofType: nil)!))
            aSharp2Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("a#2Sound.wav", ofType: nil)!))
            b2Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("b2Sound.wav", ofType: nil)!))
            c2Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("c2Sound.wav", ofType: nil)!))
            cSharp2Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("c#2Sound.wav", ofType: nil)!))
            d2Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("d2Sound.wav", ofType: nil)!))
            dSharp2Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("d#2Sound.wav", ofType: nil)!))
            e2Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("e2Sound.wav", ofType: nil)!))
            f2Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("f2Sound.wav", ofType: nil)!))
            fSharp2Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("f#2Sound.wav", ofType: nil)!))
            g2Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("g2Sound.wav", ofType: nil)!))
            gSharp2Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("g#2Sound.wav", ofType: nil)!))
            a3Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("a3Sound.wav", ofType: nil)!))
            aSharp3Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("a#3Sound.wav", ofType: nil)!))
            b3Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("b3Sound.wav", ofType: nil)!))
            c3Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("c3Sound.wav", ofType: nil)!))
            cSharp3Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("c#3Sound.wav", ofType: nil)!))
            d3Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("d3Sound.wav", ofType: nil)!))
            dSharp3Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("d#3Sound.wav", ofType: nil)!))
            e3Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("e3Sound.wav", ofType: nil)!))
            f3Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("f3Sound.wav", ofType: nil)!))
            fSharp3Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("f#3Sound.wav", ofType: nil)!))
            g3Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("g3Sound.wav", ofType: nil)!))
            gSharp3Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("g#3Sound.wav", ofType: nil)!))
            a4Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("a4Sound.wav", ofType: nil)!))
            aSharp4Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("a#4Sound.wav", ofType: nil)!))
            b4Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("b4Sound.wav", ofType: nil)!))
            c4Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("c4Sound.wav", ofType: nil)!))
            cSharp4Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("c#4Sound.wav", ofType: nil)!))
            d4Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("d4Sound.wav", ofType: nil)!))
            dSharp4Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("d#4Sound.wav", ofType: nil)!))
            e4Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("e4Sound.wav", ofType: nil)!))
            f4Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("f4Sound.wav", ofType: nil)!))
            fSharp4Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("f#4Sound.wav", ofType: nil)!))
            g4Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("g4Sound.wav", ofType: nil)!))
            gSharp4Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("g#4Sound.wav", ofType: nil)!))
            a5Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("a5Sound.wav", ofType: nil)!))
            aSharp5Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("a#5Sound.wav", ofType: nil)!))
            b5Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("b5Sound.wav", ofType: nil)!))
            c5Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("c5Sound.wav", ofType: nil)!))
            cSharp5Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("c#5Sound.wav", ofType: nil)!))
            d5Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("d5Sound.wav", ofType: nil)!))
            dSharp5Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("d#5Sound.wav", ofType: nil)!))
            e5Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("e5Sound.wav", ofType: nil)!))
            f5Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("f5Sound.wav", ofType: nil)!))
            fSharp5Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("f#5Sound.wav", ofType: nil)!))
            g5Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("g5Sound.wav", ofType: nil)!))
            gSharp5Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("g#5Sound.wav", ofType: nil)!))
            a6Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("a6Sound.wav", ofType: nil)!))
            aSharp6Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("a#6Sound.wav", ofType: nil)!))
            b6Sound = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("b6Sound.wav", ofType: nil)!))
            
        } catch {}
        
        a2Sound.prepareToPlay()
        pianoSounds["a2Sound"] = c2Sound
        aSharp2Sound.prepareToPlay()
        pianoSounds["a#2Sound"] = aSharp2Sound
        b2Sound.prepareToPlay()
        pianoSounds["b2Sound"] = b2Sound
        c2Sound.prepareToPlay()
        pianoSounds["c2Sound"] = c2Sound
        cSharp2Sound.prepareToPlay()
        pianoSounds["c#2Sound"] = cSharp2Sound
        d2Sound.prepareToPlay()
        pianoSounds["d2Sound"] = d2Sound
        dSharp2Sound.prepareToPlay()
        pianoSounds["d#2Sound"] = dSharp2Sound
        e2Sound.prepareToPlay()
        pianoSounds["e2Sound"] = e2Sound
        f2Sound.prepareToPlay()
        pianoSounds["f2Sound"] = f2Sound
        fSharp2Sound.prepareToPlay()
        pianoSounds["f#2Sound"] = fSharp2Sound
        g2Sound.prepareToPlay()
        pianoSounds["g2Sound"] = g2Sound
        gSharp2Sound.prepareToPlay()
        pianoSounds["g#2Sound"] = gSharp2Sound
        a3Sound.prepareToPlay()
        pianoSounds["a3Sound"] = a3Sound
        aSharp3Sound.prepareToPlay()
        pianoSounds["a#3Sound"] = aSharp3Sound
        b3Sound.prepareToPlay()
        pianoSounds["b3Sound"] = b3Sound
        c3Sound.prepareToPlay()
        pianoSounds["c3Sound"] = c3Sound
        cSharp3Sound.prepareToPlay()
        pianoSounds["c#3Sound"] = cSharp3Sound
        d3Sound.prepareToPlay()
        pianoSounds["d3Sound"] = d3Sound
        dSharp3Sound.prepareToPlay()
        pianoSounds["d#3Sound"] = dSharp3Sound
        e3Sound.prepareToPlay()
        pianoSounds["e3Sound"] = e3Sound
        f3Sound.prepareToPlay()
        pianoSounds["f3Sound"] = f3Sound
        fSharp3Sound.prepareToPlay()
        pianoSounds["f#3Sound"] = fSharp3Sound
        g3Sound.prepareToPlay()
        pianoSounds["g3Sound"] = g3Sound
        gSharp3Sound.prepareToPlay()
        pianoSounds["g#3Sound"] = gSharp3Sound
        a4Sound.prepareToPlay()
        pianoSounds["a4Sound"] = a4Sound
        aSharp4Sound.prepareToPlay()
        pianoSounds["a#4Sound"] = aSharp4Sound
        b4Sound.prepareToPlay()
        pianoSounds["b4Sound"] = b4Sound
        c4Sound.prepareToPlay()
        pianoSounds["c4Sound"] = c4Sound
        cSharp4Sound.prepareToPlay()
        pianoSounds["c#4Sound"] = cSharp4Sound
        d4Sound.prepareToPlay()
        pianoSounds["d4Sound"] = d4Sound
        dSharp4Sound.prepareToPlay()
        pianoSounds["d#4Sound"] = dSharp4Sound
        e4Sound.prepareToPlay()
        pianoSounds["e4Sound"] = e4Sound
        f4Sound.prepareToPlay()
        pianoSounds["f4Sound"] = f4Sound
        fSharp4Sound.prepareToPlay()
        pianoSounds["f#4Sound"] = fSharp4Sound
        g4Sound.prepareToPlay()
        pianoSounds["g4Sound"] = g4Sound
        gSharp4Sound.prepareToPlay()
        pianoSounds["g#4Sound"] = gSharp4Sound
        a5Sound.prepareToPlay()
        pianoSounds["a5Sound"] = a5Sound
        aSharp5Sound.prepareToPlay()
        pianoSounds["a#5Sound"] = aSharp5Sound
        b5Sound.prepareToPlay()
        pianoSounds["b5Sound"] = b5Sound
        c5Sound.prepareToPlay()
        pianoSounds["c5Sound"] = c5Sound
        cSharp5Sound.prepareToPlay()
        pianoSounds["c#5Sound"] = cSharp5Sound
        d5Sound.prepareToPlay()
        pianoSounds["d5Sound"] = d5Sound
        dSharp5Sound.prepareToPlay()
        pianoSounds["d#5Sound"] = dSharp5Sound
        e5Sound.prepareToPlay()
        pianoSounds["e5Sound"] = e5Sound
        f5Sound.prepareToPlay()
        pianoSounds["f5Sound"] = f5Sound
        fSharp5Sound.prepareToPlay()
        pianoSounds["f#5Sound"] = fSharp5Sound
        g5Sound.prepareToPlay()
        pianoSounds["g5Sound"] = g5Sound
        gSharp5Sound.prepareToPlay()
        pianoSounds["g#5Sound"] = gSharp5Sound
        a6Sound.prepareToPlay()
        pianoSounds["a6Sound"] = a6Sound
        aSharp6Sound.prepareToPlay()
        pianoSounds["a#6Sound"] = a6Sound
        b6Sound.prepareToPlay()
        pianoSounds["b6Sound"] = a6Sound
    }
    
    func pianoKeyPressed(sender: UIButton) {
        
        resetKeyPressed()
        lastButtonPressed = sender
        sender.setBackgroundImage(UIImage(named: "piano-key-selected-background.png"), forState: .Normal)
        
        var key = String(sender.currentTitle!)
        if(sender.tag > 9) {
            key += String(sender.tag/10)
        }
        PianoViewController.pianoKeyTitlePressed(key)
        
        if(Notes.practicing) {
            p.processGuess(sender)
        }
    }
    
    static func pianoKeyTitlePressed(note: String) {
        pianoSounds[note.lowercaseString+"Sound"]!.play()
        
    }
    
    func resetKeyPressed() {
        if(lastButtonPressed != nil) {
            if(lastButtonPressed.currentTitleColor == UIColor.whiteColor()) {
                lastButtonPressed.setBackgroundImage(UIImage(named: "piano-key-black-background.png"), forState: .Normal)
            } else {
                lastButtonPressed.setBackgroundImage(UIImage(named: "piano-key-background.png"), forState: .Normal)
            }
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
