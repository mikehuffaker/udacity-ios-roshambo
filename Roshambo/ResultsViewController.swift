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
    @IBOutlet weak var ImgResults: UIImageView!
    
    // MHH - playtype integer set according to button tag from first view controller
    var playType: PlayType
    var computerPlayType: PlayType
    
    required init?(coder: NSCoder)
    {
        print( "in ResultsViewController::init()")

        playType = .Nothing
        computerPlayType = .Nothing
        super.init(coder: coder)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print( "in ResultsViewController::viewDidLoad()")

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear ( animated )
        print( "in ResultsViewController::viewWillAppear()")

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

        // MHH - Computer picks based on random value of 1-3
        computerPlayType = PlayType ( rawValue: randomPlayValue() )!
        
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

        // MHH - Handle different game outcomes and set message/image appropriately
        if ( playType == computerPlayType )
        {
            resultsMsg += "\nIts a Tie!"
            ImgResults.image = UIImage(named: "itsATie")
        }
        else if ( playType == .Rock && computerPlayType == .Scissors )
        {
            resultsMsg += "\nYou Win!"
            ImgResults.image = UIImage(named: "RockCrushesScissors")
        }
        else if ( playType == .Paper && computerPlayType == .Rock )
        {
            resultsMsg += "\nYou Win!"
            ImgResults.image = UIImage(named: "PaperCoversRock")
        }
        else if ( playType == .Scissors && computerPlayType == .Paper )
        {
            resultsMsg += "\nYou Win!"
            ImgResults.image = UIImage(named: "ScissorsCutPaper")
        }
        else
        {
            resultsMsg += "\nYou Lose!"
            if ( playType == .Rock && computerPlayType == .Paper )
            {
                ImgResults.image = UIImage(named: "PaperCoversRock")
            }
            else if ( playType == .Paper && computerPlayType == .Scissors )
            {
                ImgResults.image = UIImage(named: "ScissorsCutPaper")
            }
            else if ( playType == .Scissors && computerPlayType == .Rock )
            {
                ImgResults.image = UIImage(named: "RockCrushesScissors")
               
            }
        }

        LblResults.text = resultsMsg
    }
    
    func randomPlayValue() -> Int
    {
        print( "in ResultsViewController::randomPlayValue()")

        let randomValue = 1 + arc4random() % 3
        
        print( "Returning:", randomValue)
        return Int(randomValue)
    }
    
    // MHH - User pressed play again, close the view and return to Play view controller
    @IBAction func dismiss(_ sender: AnyObject)
    {
        print( "in ResultsViewController::dismiss()")

        self.dismiss( animated: true, completion: nil )
    }
    
}
