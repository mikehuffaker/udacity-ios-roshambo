//
//  PlayViewController.swift
//  Roshambo
//
//  Created by Mike Huffaker on 11/1/16.
//  Copyright © 2016 Mike Huffaker. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController
{
    @IBOutlet weak var BtnRock: UIButton!
    @IBOutlet weak var BtnPaper: UIButton!
    @IBOutlet weak var BtnScissors: UIButton!
    
    var btnPressedTag = 0
    
    // Array of match classes for history
    var history = [Match]()
    
    override func viewDidLoad()
    {
        print( "in PlayViewController::viewDidLoad()")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // method to consolidate setting up the match and play type before the
    // segue to the PlayViewController
    func setupMatch( button_tag: Int, results_VC: ResultsViewController ) -> Void
    {
        print( "in PlayViewController::setupMatch()")
        print( "setting human playType to: ", button_tag )
        
        // OK - I took a different approach from the lesson.  Since Swift classes
        // are references, it makes the most sense to me to create a "Match" class for
        // each play and "Push" that match onto the history stack.  Since its a
        // reference to the class, then the ResultsViewController can access it
        // and call the methods to calculate the winner, and volia, the class is
        // updated in the history array.  This makes more sense to me then passing
        // around a struct, plus we can encapsulate the logic to calculate the
        // winner into the "Match" class
        let humanPlayType = PlayType( rawValue: btnPressedTag )
        results_VC.matchRound = Match( humanPlay: humanPlayType! )
        
        // append the just created Match class to the history array.
        history.append( results_VC.matchRound )
    }
    
    // Method 1 - User pressed Rock button, do a manual Seg with Code
    @IBAction func playRock(_ sender: AnyObject)
    {
        print( "in PlayViewController::playRock()")
        
        btnPressedTag = sender.tag
        performSegue( withIdentifier: "ResultsVC", sender: self )
    }
    
    // Method 2 - Paper is wired directly to segue, no code in final implementation
    //@IBAction func playPaper(_ sender: AnyObject)
    //{
    //    print( "in PlayViewController::playPaper()")
    //    btnPressedTag = sender.tag
    //}

    // Method 3 - User pressed Scissors button, do a transfer to the next view without segue
    @IBAction func playScissors(_ sender: AnyObject)
    {
        print( "in PlayViewController::playScissors()" )

        let controller = self.storyboard?.instantiateViewController( withIdentifier: "ResultsVC" ) as! ResultsViewController
        btnPressedTag = sender.tag
        setupMatch( button_tag: btnPressedTag, results_VC: controller )
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func matchHistory(_ sender: Any)
    {
        print( "in PlayViewController::matchHistory" )
        
        performSegue( withIdentifier: "HistoryVC", sender: self )
    }
    
    // For Rock and Scissors, we call a segue, so handle setting the play value here
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print( "in PlayViewController::prepare()" )
        print( "Segue called was:" + segue.identifier! )
      
        if segue.identifier == "ResultsVC" || segue.identifier == "ResultsVC2"
        {
            let controller = segue.destination as! ResultsViewController

            // Handle situation for paper button, I found that sender will be populated
            // with UIButton when the button is directly wired with a Segue option, but
            // in other situations it was sometimes another object and causing a crash
            if (sender as? UIButton) != nil
            {
                let btnTemp = (sender as? UIButton)
                btnPressedTag = (btnTemp?.tag)!
            }
           
            setupMatch( button_tag: btnPressedTag, results_VC: controller )
        }
        // Before segue to the history view, give it a copy of the up-to-date
        // history array with all matches
        else if ( segue.identifier == "HistoryVC" )
        {
            let controller = segue.destination as! HistoryViewController
            controller.history = self.history
        }
        
        print( "Exiting PlayViewController::prepare()" )
    }
}

