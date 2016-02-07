//
//  StatisticsViewController.swift
//  Read Music
//
//  Created by Lavanya Kannan on 1/11/16.
//  Copyright © 2016 Lavanya Kannan. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    @IBOutlet weak var best20LettersTrebleLabel: UILabel!
    @IBOutlet weak var best40LettersTrebleLabel: UILabel!
    @IBOutlet weak var best60LettersTrebleLabel: UILabel!
    @IBOutlet weak var mostPerMinLettersTrebleLabel: UILabel!
    @IBOutlet weak var accuracyLettersTrebleLabel: UILabel!
    
    @IBOutlet weak var best20LettersBaseLabel: UILabel!
    @IBOutlet weak var best40LettersBaseLabel: UILabel!
    @IBOutlet weak var best60LettersBaseLabel: UILabel!
    @IBOutlet weak var mostPerMinLettersBaseLabel: UILabel!
    @IBOutlet weak var accuracyLettersBaseLabel: UILabel!
    
    @IBOutlet weak var best20LettersBothLabel: UILabel!
    @IBOutlet weak var best40LettersBothLabel: UILabel!
    @IBOutlet weak var best60LettersBothLabel: UILabel!
    @IBOutlet weak var mostPerMinLettersBothLabel: UILabel!
    @IBOutlet weak var accuracyLettersBothLabel: UILabel!
    
    @IBOutlet weak var best20PianoTrebleLabel: UILabel!
    @IBOutlet weak var best40PianoTrebleLabel: UILabel!
    @IBOutlet weak var best60PianoTrebleLabel: UILabel!
    @IBOutlet weak var mostPerMinPianoTrebleLabel: UILabel!
    @IBOutlet weak var accuracyPianoTrebleLabel: UILabel!
    
    @IBOutlet weak var best20PianoBaseLabel: UILabel!
    @IBOutlet weak var best40PianoBaseLabel: UILabel!
    @IBOutlet weak var best60PianoBaseLabel: UILabel!
    @IBOutlet weak var mostPerMinPianoBaseLabel: UILabel!
    @IBOutlet weak var accuracyPianoBaseLabel: UILabel!
    
    @IBOutlet weak var best20PianoBothLabel: UILabel!
    @IBOutlet weak var best40PianoBothLabel: UILabel!
    @IBOutlet weak var best60PianoBothLabel: UILabel!
    @IBOutlet weak var mostPerMinPianoBothLabel: UILabel!
    @IBOutlet weak var accuracyPianoBothLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        updateStatLabels()
    }
    
    override func viewWillAppear(animated: Bool) {
        updateStatLabels()
    }
    
    func updateStatLabels() {
        
        best20LettersTrebleLabel.text = String(Notes.bestRuns[0][0])
        best40LettersTrebleLabel.text = String(Notes.bestRuns[0][1])
        best60LettersTrebleLabel.text = String(Notes.bestRuns[0][2])
        
        best20LettersBaseLabel.text = String(Notes.bestRuns[1][0])
        best40LettersBaseLabel.text = String(Notes.bestRuns[1][1])
        best60LettersBaseLabel.text = String(Notes.bestRuns[1][2])

        best20LettersBothLabel.text = String(Notes.bestRuns[2][0])
        best40LettersBothLabel.text = String(Notes.bestRuns[2][1])
        best60LettersBothLabel.text = String(Notes.bestRuns[2][2])
        
        best20PianoTrebleLabel.text = String(Notes.bestRuns[3][0])
        best40PianoTrebleLabel.text = String(Notes.bestRuns[3][1])
        best60PianoTrebleLabel.text = String(Notes.bestRuns[3][2])
        
        best20PianoBaseLabel.text = String(Notes.bestRuns[4][0])
        best40PianoBaseLabel.text = String(Notes.bestRuns[4][1])
        best60PianoBaseLabel.text = String(Notes.bestRuns[4][2])

        best20PianoBothLabel.text = String(Notes.bestRuns[5][0])
        best40PianoBothLabel.text = String(Notes.bestRuns[5][1])
        best60PianoBothLabel.text = String(Notes.bestRuns[5][2])

        mostPerMinLettersTrebleLabel.text = String(Notes.mostPerMin[0])
        mostPerMinLettersBaseLabel.text = String(Notes.mostPerMin[1])
        mostPerMinLettersBothLabel.text = String(Notes.mostPerMin[2])
        mostPerMinPianoTrebleLabel.text = String(Notes.mostPerMin[3])
        mostPerMinPianoBaseLabel.text = String(Notes.mostPerMin[4])
        mostPerMinPianoBothLabel.text = String(Notes.mostPerMin[5])
        
        accuracyLettersTrebleLabel.text = String(Notes.accuracy[0]) + "%"
        accuracyLettersBaseLabel.text = String(Notes.accuracy[1]) + "%"
        accuracyLettersBothLabel.text = String(Notes.accuracy[2]) + "%"
        accuracyPianoTrebleLabel.text = String(Notes.accuracy[3]) + "%"
        accuracyPianoBaseLabel.text = String(Notes.accuracy[4]) + "%"
        accuracyPianoBothLabel.text = String(Notes.accuracy[5]) + "%"

    }
    
    @IBAction func resetStats(sender: UIButton) {
        
        Notes.resetStats()
        updateStatLabels()
    }
}
