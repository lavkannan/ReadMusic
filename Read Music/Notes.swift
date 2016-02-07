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
    static var statIndex = 0
    
    static var totalCorrect = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    static var totalMistakes = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    
    static var bestRuns = [[0,0,0], [0,0,0], [0,0,0], [0,0,0], [0,0,0], [0,0,0]]
    static var mostPerMin = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    static var accuracy = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    
    static var stats = NSUserDefaults.standardUserDefaults()
    
    static func retrieveStats() {
        
        totalCorrect[0] = stats.doubleForKey("totalCorrectLettersTreble")
        totalCorrect[1] = stats.doubleForKey("totalCorrectLettersBase")
        totalCorrect[2] = stats.doubleForKey("totalCorrectLettersBoth")
        totalCorrect[3] = stats.doubleForKey("totalCorrectPianoTreble")
        totalCorrect[4] = stats.doubleForKey("totalCorrectPianoBase")
        totalCorrect[5] = stats.doubleForKey("totalCorrectPianoBoth")
        
        totalMistakes[0] = stats.doubleForKey("totalMistakesLettersTreble")
        totalMistakes[1] = stats.doubleForKey("totalMistakesLettersBase")
        totalMistakes[2] = stats.doubleForKey("totalMistakesLettersBoth")
        totalMistakes[3] = stats.doubleForKey("totalMistakesPianoTreble")
        totalMistakes[4] = stats.doubleForKey("totalMistakesPianoBase")
        totalMistakes[5] = stats.doubleForKey("totalMistakesPianoBoth")
        
        bestRuns[0][0] = stats.integerForKey("best20LettersTreble")
        bestRuns[0][1] = stats.integerForKey("best40LettersTreble")
        bestRuns[0][2] = stats.integerForKey("best60LettersTreble")
        
        bestRuns[1][0] = stats.integerForKey("best20LettersBase")
        bestRuns[1][1] = stats.integerForKey("best40LettersBase")
        bestRuns[1][2] = stats.integerForKey("best60LettersBase")
        
        bestRuns[2][0] = stats.integerForKey("best20LettersBoth")
        bestRuns[2][1] = stats.integerForKey("best40LettersBoth")
        bestRuns[2][2] = stats.integerForKey("best60LettersBoth")
        
        bestRuns[3][0] = stats.integerForKey("best20PianoTreble")
        bestRuns[3][1] = stats.integerForKey("best40PianoTreble")
        bestRuns[3][2] = stats.integerForKey("best60PianoTreble")
        
        bestRuns[4][0] = stats.integerForKey("best20PianoBase")
        bestRuns[4][1] = stats.integerForKey("best40PianoBase")
        bestRuns[4][2] = stats.integerForKey("best60PianoBase")
        
        bestRuns[5][0] = stats.integerForKey("best20PianoBoth")
        bestRuns[5][1] = stats.integerForKey("best40PianoBoth")
        bestRuns[5][2] = stats.integerForKey("best60PianoBoth")
        
        mostPerMin[0] = stats.doubleForKey("mostPerMinLettersTreble")
        mostPerMin[1] = stats.doubleForKey("mostPerMinLettersBase")
        mostPerMin[2] = stats.doubleForKey("mostPerMinLettersBoth")
        mostPerMin[3] = stats.doubleForKey("mostPerMinPianoTreble")
        mostPerMin[4] = stats.doubleForKey("mostPerMinPianoBase")
        mostPerMin[5] = stats.doubleForKey("mostPerMinPianoBoth")
        
        accuracy[0] = stats.doubleForKey("accuracyLettersTreble")
        accuracy[1] = stats.doubleForKey("accuracyLettersBase")
        accuracy[2] = stats.doubleForKey("accuracyLettersBoth")
        accuracy[3] = stats.doubleForKey("accuracyPianoTreble")
        accuracy[4] = stats.doubleForKey("accuracyPianoBase")
        accuracy[5] = stats.doubleForKey("accuracyPianoBoth")
    }
    
    static func resetStats() {
        
        for key in stats.dictionaryRepresentation().keys {
            stats.removeObjectForKey(key)
        }
        retrieveStats()
    }
    
    static func updateSettingChange() {
        if(letterPractice) {
            switch practiceClef {
                
            case Clef.Treble: statIndex = 0
            case Clef.Base: statIndex = 1
            case Clef.Both: statIndex = 2
            }
            
        } else {
            switch practiceClef {
                
            case Clef.Treble: statIndex = 3
            case Clef.Base: statIndex = 4
            case Clef.Both: statIndex = 5
            }
        }
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
        
        var num = 0.0
        num = ++totalCorrect[statIndex]
        var key = ""
        
        if (letterPractice) { key = "totalCorrectLetters" }
        else { key = "totalCorrectPiano" }
        
        updateGuesses(num, key: (key+practiceClef.rawValue) )
    }
    
    static func incrementTotalMistakes() {
        
        var num = 0.0
        num = ++totalMistakes[statIndex]
        var key = ""
        
        if (letterPractice) { key = "totalMistakesLetters" }
        else { key = "totalMistakesPiano" }
        
        updateGuesses(num, key: (key+practiceClef.rawValue) )
    }
    
    static func updateGuesses(n: Double, key: String) {
        stats.setDouble(n, forKey: key)
    }
    
    static func updateBestRun(numCorrect: Int) {
        
        let bestRunIndex = Int(practiceTime)/20 - 1
        let practiceType = (letterPractice ? "Letters" : "Piano") + practiceClef.rawValue
        
        if(numCorrect > bestRuns[statIndex][bestRunIndex]) {
            bestRuns[statIndex][bestRunIndex] = numCorrect
            let key = "best"+String(Int(practiceTime)) + practiceType
            stats.setInteger(numCorrect, forKey: key)
        }
        
        var mult = 3.0 - Double(bestRunIndex)
        if(bestRunIndex == 1) {
            mult = 1.5
        }
        
        let perMin = Double(numCorrect) * mult
        
        if (perMin > mostPerMin[statIndex]) {
            mostPerMin[statIndex] = perMin
            stats.setDouble(perMin, forKey: "mostPerMin" + practiceType)
        }
        
        let numCorrect = totalCorrect[statIndex]
        let totalGuesses = numCorrect + totalMistakes[statIndex]
        let percent = (totalGuesses == 0 ? 0 : numCorrect/totalGuesses*100)
        accuracy[statIndex] = round(percent*100)/100.0
        stats.setDouble(accuracy[statIndex], forKey: "accuracy" + practiceType )
    }
    
    enum Clef : String {
        case Treble = "Treble"
        case Base = "Base"
        case Both = "Both"
    }
}


