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
    
    override func viewDidLoad()
    {
        print( "in PlayViewController::viewDidLoad()")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        print( "setting playType to: ", btnPressedTag )
        controller.playType = PlayType ( rawValue: btnPressedTag )!
        present(controller, animated: true, completion: nil)
    }
    
    // For Rock and Scissors, we call a segue, so handle setting the play value here
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print( "in PlayViewController::prepare()" )
      
        if segue.identifier == "ResultsVC" || segue.identifier == "ResultsVC2"
        {
            let controller = segue.destination as!
            ResultsViewController

            // Handle situation for paper button, I found that sender will be populated
            // with UIButton when the button is directly wired with a Segue option, but
            // in other situations it is another object
            if (sender as? UIButton) != nil
            {
                let btnTemp = (sender as? UIButton)
                btnPressedTag = (btnTemp?.tag)!
            }

            print( "setting playType to: ", btnPressedTag )
            controller.playType = PlayType ( rawValue: btnPressedTag )!
        }
    }
}

