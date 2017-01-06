//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Mike Huffaker on 11/1/16.
//  Copyright © 2016 Mike Huffaker. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController
{
    @IBOutlet weak var LblResults: UILabel!
    @IBOutlet weak var ImgResults: UIImageView!
    
    var matchRound: Match!
    
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
        
        calculateAndSetResults()
    }
    
    func calculateAndSetResults()
    {
        print( "in ResultsViewController::calculateAndSetResults()")

        _ = matchRound.calculateWinner()
        
        LblResults.text = matchRound.winMessage + "\n" + matchRound.detailMessage
        ImgResults.image = UIImage( named: matchRound.imageName )
       
        return
    }
    
    @IBAction func playAgain(_ sender: Any)
    {
        if let navigationController = navigationController
        {
            navigationController.popToRootViewController( animated: true )
        }
    }
}
