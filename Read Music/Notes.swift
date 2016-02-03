//
//  Notes.swift
//  Read Music
//
//  Created by Lavanya Kannan on 12/24/15.
//  Copyright © 2015 Lavanya Kannan. All rights reserved.
//

import UIKit

struct Notes {
    
    static var notes = ["A","B","C","D","E","F","G"]
    static var learnClef = Clef.Treble
    static var randomPractice = ""
    
    static var practiceClef = Clef.Treble
    static var randClef = Clef.Treble
    static var practicing = false
    static var letterPractice = true
    static var practiceTime = 20.0
    
    static var totalCorrect = 0.0
    static var totalMistakes = 0.0
    static var totalCorrectPiano = 0.0
    static var totalMistakesPiano = 0.0
    
    static var bestRuns = [0, 0, 0, 0, 0, 0]
    static var mostPerMin = 0.0
    static var accuracy = 0.0
    static var mostPerMinPiano = 0.0
    static var accuracyPiano = 0.0
    
    static var stats = NSUserDefaults.standardUserDefaults()
    
    static func retrieveStats() {
        
        totalCorrect = stats.doubleForKey("totalCorrect")
        totalMistakes = stats.doubleForKey("totalMistakes")
        bestRuns[0] = stats.integerForKey("best20")
        bestRuns[1] = stats.integerForKey("best40")
        bestRuns[2] = stats.integerForKey("best60")
        bestRuns[3] = stats.integerForKey("best20Piano")
        bestRuns[4] = stats.integerForKey("best40Piano")
        bestRuns[5] = stats.integerForKey("best60Piano")
        mostPerMin = stats.doubleForKey("mostPerMin")
        accuracy = stats.doubleForKey("accuracy")
        
    }
    
    static func resetStats() {
        
        for key in stats.dictionaryRepresentation().keys {
            stats.removeObjectForKey(key)
        }
        retrieveStats()
    }
    
    static func getNote(tag: Int) -> String {
        
        if(learnClef == Clef.Treble) {
            return notes[(tag-1)%7] + String((tag-1)/7+4)
        }
        return notes[(tag+1)%7] + String((tag+1)/7+2)
    }
    
    static func getPracticeRandom() -> String {
        var randNote = ""
        
        repeat {
            let random = randInt(6)
            let randStr = notes[random].lowercaseString
        
            if(practiceClef == Clef.Base || (practiceClef == Clef.Both && randInt(1) == 0)) {
        
                randClef = Clef.Base
                randNote = getRandBase(random, randStr: randStr)
            } else {
        
                randClef = Clef.Treble
                randNote = getRandTreble(random, randStr: randStr)
            }
        } while (randNote == randomPractice)
        
        randomPractice = randNote
        return randNote
    }
    
    private static func getRandBase(random: Int, var randStr: String) -> String {
        
        if(random < 3) {
            randStr += String(randInt(2)+2)
        } else {
            randStr += String(randInt(1)+2)
        }
        
        return randStr
    }
    
    private static func getRandTreble(random: Int, var randStr: String) -> String {
        
        randStr += String(randInt(1)+4)
        return randStr
    }
    
    static func checkGuess(n: String) -> Bool {
        
        if(!letterPractice) {
            return n.lowercaseString == randomPractice
        }

        return n.lowercaseString == (randomPractice as NSString).substringToIndex(1)
    }
    
    static func randInt (upper: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upper + 1)))
    }
    
    static func changeLearnClef() {
        if(learnClef == Clef.Treble) {
            learnClef = Clef.Base
        } else {
            learnClef = Clef.Treble
        }
    }
    
    static func incrementTotalCorrect() {
        
        if(letterPractice) {
            totalCorrect++
            stats.setDouble(totalCorrect, forKey: "totalCorrect")
        
        } else {
            totalCorrectPiano++
            stats.setDouble(totalCorrect, forKey: "totalCorrectPiano")
            
        }
    }
    
    static func incrementTotalMistakes() {
        
        if(letterPractice) {
            totalMistakes++
            stats.setDouble(totalCorrect, forKey: "totalMistakes")
            
        } else {
            totalMistakesPiano++
            stats.setDouble(totalCorrect, forKey: "totalMistakesPiano")
            
        }
    }
    
    static func updateBestRun(numCorrect: Int) {
        
        let bestRunIndex = Int(practiceTime)/20 - 1 + (letterPractice ? 0 : 3)
        
        if(numCorrect > bestRuns[bestRunIndex]) {
            bestRuns[bestRunIndex] = numCorrect
            let key = "best"+String(Int(practiceTime)) + (letterPractice ? "" : "Piano")
            stats.setInteger(numCorrect, forKey: key)
        }
        
        var mult = 3.0 - Double(bestRunIndex % 3)
        if(bestRunIndex == 1 || bestRunIndex == 4) {
            mult = 1.5
        }
        
        let perMin = Double(numCorrect) * mult
        
        if (letterPractice) {
            if (perMin > mostPerMin) {
                mostPerMin = perMin
                stats.setDouble(perMin, forKey: "mostPerMin")
            }
        } else {
            if (perMin > mostPerMinPiano) {
                mostPerMinPiano = perMin
                stats.setDouble(perMin, forKey: "mostPerMinPiano")
            }
        }
        
        let numCorrect = letterPractice ? totalCorrect : totalCorrectPiano
        let totalGuesses = numCorrect + (letterPractice ? totalMistakes : totalMistakesPiano)
        let percent = (totalGuesses == 0 ? 0 : numCorrect/totalGuesses*100)
        if (letterPractice) {
            accuracy = round(percent*100)/100.0
        } else {
            accuracyPiano = round(percent*100)/100.0
        }
        stats.setDouble(accuracy, forKey: (letterPractice ? "accuracy" : "accuracyPiano") )
    }
    
    enum Clef : String {
        case Treble = "Treble"
        case Base = "Base"
        case Both = "Both"
    }
}


