//
//  PlayViewController.swift
//  Roshambo
//
//  Created by Mike Huffaker on 11/1/16.
//  Copyright © 2016 Mike Huffaker. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    @IBOutlet weak var BtnRock: UIButton!
    @IBOutlet weak var BtnPaper: UIButton!
    @IBOutlet weak var BtnScissors: UIButton!
    
    var btnPressedTag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func prepare(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        print( "in PlayViewController::prepare()" )
        
        if segue.identifier == "ResultsVC" {
            
            let controller = segue.destination as!
            ResultsViewController
            
            controller.playType = self.btnPressedTag
        }
    }

    // User pressed Rock button, do a manual Seg with Code
    @IBAction func playRock(_ sender: AnyObject)
    {
        print( "in PlayViewController::playRock()")
        btnPressedTag = BtnRock.tag
        performSegue( withIdentifier: "ResultsVC", sender: self )
    }
}

