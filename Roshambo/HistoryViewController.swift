//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Mike Huffaker on 12/21/16.
//  Copyright © 2016 Mike Huffaker. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var history = [Match]()

    
    override func viewDidLoad()
    {
        print( "in HistoryViewController::viewDidLoad()")
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print( "in HistoryViewController::tableView::numberOfRowsInSection" )
        print( "returning: ", history.count )
        
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        print( "in HistoryViewController::tableView::cellForRowAt" )
        
        let cellID = "HistoryCell"
        
        let cell = tableView.dequeueReusableCell( withIdentifier: cellID, for: indexPath )
        
        let match = self.history[(indexPath as NSIndexPath).row]
        cell.textLabel!.text = match.message
        
        // Set cell values
        
        return cell
    }
    
    // User pressed done - return to PlayViewController
    @IBAction func dismiss(_ sender: Any)
    {
        print( "in HistoryViewController::dismiss()")
        
        self.dismiss( animated: true, completion: nil )
    }
    
}

