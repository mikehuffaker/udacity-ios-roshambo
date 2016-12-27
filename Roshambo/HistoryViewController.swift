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
    @IBOutlet weak var historyTable: UITableView!
    
    var history = [Match]()

    override func viewDidLoad()
    {
        print( "in HistoryViewController::viewDidLoad()")
        super.viewDidLoad()

        // Per a tutorial on this web page: https://www.raywenderlich.com/129059/self-sizing-table-view-cells
        // this is supposed to help tell Auto Layout to resize the table cells as needed.  It does infact work.
        // If I comment this code out, the lblDtl field will not resize to hold 2 lines of text when I test the
        // app on a smaller screen, such as the iPhone 5 screen.
        historyTable.rowHeight = UITableViewAutomaticDimension
        historyTable.estimatedRowHeight = 100
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
        
        let cell:HistoryCell = tableView.dequeueReusableCell( withIdentifier: cellID, for: indexPath ) as! HistoryCell
        
        let match = self.history[(indexPath as NSIndexPath).row]
        
        // Set table view cell values after parsing out from match class object
        let img = UIImage( named: match.imageName )
        cell.imgResults!.image = img
        
        cell.lblHdr.text = match.winMessage
        
        cell.lblDtl.textColor = UIColor.darkGray
        cell.lblDtl.adjustsFontSizeToFitWidth = true
        cell.lblDtl.text = match.detailMessage
        
        return cell
    }
    
    // User pressed done - return to PlayViewController
    @IBAction func dismiss(_ sender: Any)
    {
        print( "in HistoryViewController::dismiss()")
        
        self.dismiss( animated: true, completion: nil )
    }
}

