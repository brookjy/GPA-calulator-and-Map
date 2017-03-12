//
//  AnotherViewController.swift
//  thinkingcat
//
//  Created by Yi Jin on 2017-03-12.
//  Copyright © 2017 Yi Jin. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps;

class AnotherViewController: UIViewController{
    
    /*-----------Init UILabel------------*/
    @IBOutlet weak var exams: UILabel!
    @IBOutlet weak var stateSwitch: UISwitch!
    
    /*-----------Tapped switch------------*/
    @IBAction func changeSwitch(sender: AnyObject) {
        updateSwitch()
    }
    
    /*-----------Update the state of Switch------------*/
    private func updateSwitch()
    {
        if stateSwitch.on
        {
            exams.text = "Exam Cancelled. Yeah!"
        }else{
            exams.text = ""
        }
    }
    
}