//
//  StatisticsViewController.swift
//  Read Music
//
//  Created by Lavanya Kannan on 1/11/16.
//  Copyright © 2016 Lavanya Kannan. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    @IBOutlet weak var best20Label: UILabel!
    @IBOutlet weak var best40Label: UILabel!
    @IBOutlet weak var best60Label: UILabel!
    @IBOutlet weak var mostPerMinLabel: UILabel!
    @IBOutlet weak var accuracyLabel: UILabel!
    
    @IBOutlet weak var best20PianoLabel: UILabel!
    @IBOutlet weak var best40PianoLabel: UILabel!
    @IBOutlet weak var best60PianoLabel: UILabel!
    @IBOutlet weak var mostPerMinPianoLabel: UILabel!
    @IBOutlet weak var accuracyPianoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        updateStatLabels()
    }
    
    override func viewWillAppear(animated: Bool) {
        updateStatLabels()
    }
    
    func updateStatLabels() {
        
        best20Label.text = String(Notes.bestRuns[0])
        best40Label.text = String(Notes.bestRuns[1])
        best60Label.text = String(Notes.bestRuns[2])
        mostPerMinLabel.text = String(Notes.mostPerMin)
        accuracyLabel.text = String(Notes.accuracy) + "%"
        
        best20PianoLabel.text = String(Notes.bestRuns[3])
        best40PianoLabel.text = String(Notes.bestRuns[4])
        best60PianoLabel.text = String(Notes.bestRuns[5])
        mostPerMinPianoLabel.text = String(Notes.mostPerMinPiano)
        accuracyPianoLabel.text = String(Notes.accuracyPiano) + "%"
        
    }
    
    @IBAction func resetStats(sender: UIButton) {
        
        Notes.resetStats()
        updateStatLabels()
    }
}
