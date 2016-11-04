//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Mike Huffaker on 11/1/16.
//  Copyright © 2016 Mike Huffaker. All rights reserved.
//

import UIKit


class ResultsViewController: UIViewController
{
    
    @IBOutlet weak var LblResults: UILabel!
    
    // MHH - playtype integer set according to button tag from first view controller
    var playType: PlayType
    var computerPlayType: PlayType
    
    required init?(coder: NSCoder)
    {
        playType = .Nothing
        computerPlayType = .Nothing
        super.init(coder: coder)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear ( animated )
        var resultsMsg = ""
        
        // Call random function to see what the computer picks
        
        // Set messages and images
        switch playType
        {
            case .Nothing:
                resultsMsg += "Nothing picked yet!"
            case .Rock:
                resultsMsg += "You picked Rock!"
            case .Paper:
                resultsMsg += "You picked Paper!"
            case .Scissors:
                resultsMsg += "You picked Scissors!"
        }

        switch computerPlayType
        {
            case .Nothing:
                resultsMsg += "\nComputer picked nothing!"
            case .Rock:
                resultsMsg += "\nComputer picked Rock!"
            case .Paper:
                resultsMsg += "\nComputer picked Paper!"
            case .Scissors:
                resultsMsg += "\nComputer picked Scissors!"
        }
        
        if ( playType == computerPlayType )
        {
            resultsMsg += "\nIts a Tie!"
        }
        else if ( (playType == .Rock && computerPlayType == .Scissors) ||
                  (playType == .Paper && computerPlayType == .Rock) ||
                  (playType == .Scissors && computerPlayType == .Paper)
                )
        {
            resultsMsg += "\nYou Win!"
        }

        LblResults.text = resultsMsg
    }
    
    func randomPlayValue() -> Int
    {
        let randomValue = 1 + arc4random() % 3
        
        return Int(randomValue)
    }

    // MHH - User pressed play again, close the view and return to Play view controller
    @IBAction func dismiss(_ sender: AnyObject)
    {
        self.dismiss( animated: true, completion: nil )
    }
    
}
