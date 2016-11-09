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
        
        // Call random function to see what the computer picks
        // MHH - Computer picks based on random value of 1-3
        computerPlayType = PlayType ( rawValue: randomPlayValue() )!
        
        // MHH - pass the human's play type and the computers play type to this method
        // to figure out who won and set the message/image appropriately
        calculateAndSetResults( humanPlay: playType, computerPlay: computerPlayType )

    }
    
    func randomPlayValue() -> Int
    {
        print( "in ResultsViewController::randomPlayValue()")

        let randomValue = 1 + arc4random() % 3
        
        print( "Returning:", randomValue)
        return Int(randomValue)
    }
    
    func calculateAndSetResults( humanPlay: PlayType, computerPlay: PlayType  )
    {
        print( "in ResultsViewController::calculateAndSetResults()")

        var resultsMsg = ""
        let playRound = ( humanPlay, computerPlay )
        
        switch playRound
        {
        case ( .Rock, .Rock ):
            resultsMsg += "Its a Tie!\nYou picked Rock and Computer picked Rock!"
            ImgResults.image = UIImage(named: "itsATie")
        
        case ( .Rock, .Paper ):
            resultsMsg += "You Lost!\nYou picked Rock and Computer picked Paper!"
            ImgResults.image = UIImage(named: "PaperCoversRock")
            
        case ( .Rock, .Scissors ):
            resultsMsg += "You Won!\nYou picked Rock and Computer picked Scissors!"
            ImgResults.image = UIImage(named: "RockCrushesScissors")
    
        case ( .Paper, .Paper ):
            resultsMsg += "Its a Tie!\n You picked Paper and Computer picked Paper!"
            ImgResults.image = UIImage(named: "itsATie")
        
        case ( .Paper, .Rock ):
            resultsMsg += "You Won!\nYou picked Paper and Computer picked Rock!"
            ImgResults.image = UIImage(named: "PaperCoversRock")
            
        case ( .Paper, .Scissors ):
            resultsMsg += "You Lost!\nYou picked Paper and Computer picked Scissors!"
            ImgResults.image = UIImage(named: "ScissorsCutPaper")
            
        case ( .Scissors, .Scissors ):
            resultsMsg += "Its a Tie!\n You picked Scissors and Computer picked Scissors!"
            ImgResults.image = UIImage(named: "itsATie")
      
        case ( .Scissors, .Rock ):
            resultsMsg += "You Lost!\nYou picked Scissors and Computer picked Rock!"
            ImgResults.image = UIImage(named: "RockCrushesScissors")
        
        case ( .Scissors, .Paper ):
            resultsMsg += "You Won!\nYou picked Scissors and Computer picked Paper!"
            ImgResults.image = UIImage(named: "ScissorsCutPaper")
            
        default:
            resultsMsg += "Unhandled condition - ask programmer for help!"
        }

        LblResults.text = resultsMsg

        return
    }
    
    // MHH - User pressed play again, close the view and return to Play view controller
    @IBAction func dismiss(_ sender: AnyObject)
    {
        print( "in ResultsViewController::dismiss()")

        self.dismiss( animated: true, completion: nil )
    }
    
}
