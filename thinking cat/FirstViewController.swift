//
//  FirstViewController.swift
//  thinkingcat
//
//  Created by Yi Jin on 2017-03-11.
//  Copyright © 2017 Yi Jin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /*-----------Content lists init------------*/
    let list = ["CSC100", "CSC115", "CSC100"]
    
    /*-----------UITable count------------*/
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (list.count)
    }
    
    /*-----------UITable reuseCell------------*/
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default,reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }

    
    


}

