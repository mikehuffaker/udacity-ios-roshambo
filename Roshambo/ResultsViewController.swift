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
    var humanPlayType: PlayType
    
    required init?(coder: NSCoder)
    {
        print( "in ResultsViewController::init()")

        humanPlayType = .Nothing
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
        
        // MHH - pass the human's play type and the computers play type to this method
        // to figure out who won and set the message/image appropriately
        calculateAndSetResults()

    }
    
    func calculateAndSetResults()
    {
        print( "in ResultsViewController::calculateAndSetResults()")

        //let playRound = ( humanPlay, computerPlay )
        let matchRound = Match( humanPlay: humanPlayType )
        
        let winner = matchRound.calculateWinner()
        
        LblResults.text = matchRound.message
        ImgResults.image = UIImage( named: matchRound.imageName )
        
        // Get the calling VC, in this case the play view controller and call the method to 
        // add the history onto the stack.
        //let PlayVC = self.parent as! PlayViewController
        
        print( "Appending played match to PlayViewController history array" )
        //PlayVC.appendMatchHistory( match: matchRound )
        
        return
    }
    
    // MHH - User pressed play again, close the view and return to Play view controller
    @IBAction func dismiss(_ sender: AnyObject)
    {
        print( "in ResultsViewController::dismiss()")

        self.dismiss( animated: true, completion: nil )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print( "in ResultsViewController::prepare()" )
        
    }
    
}
