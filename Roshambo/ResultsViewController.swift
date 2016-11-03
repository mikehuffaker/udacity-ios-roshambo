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
    
    // MHH - playtype integer set according to button tag from first view controller
    var playType: Int?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MHH - User pressed play again, close the view and return to Play view controller
    @IBAction func dismiss(_ sender: AnyObject)
    {
        self.dismiss( animated: true, completion: nil )
    }
    
}
