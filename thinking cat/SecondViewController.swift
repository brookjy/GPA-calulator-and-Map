//
//  SecondViewController.swift
//  thinkingcat
//
//  Created by Yi Jin on 2017-03-11.
//  Copyright © 2017 Yi Jin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    /*-----------Init labels ------------*/
    @IBOutlet private weak var display: UILabel!
    @IBOutlet private weak var assignment: UILabel!
    @IBOutlet private weak var homework: UILabel!
    @IBOutlet private weak var total: UILabel!
    @IBOutlet private weak var midterm: UILabel!
    @IBOutlet private weak var final: UILabel!
    @IBOutlet private weak var grade: UILabel!
    
    /*-----------Init Local Vars------------*/
    private var UserIsInTheMiddleOfTyping = false   //changing state.
    private var assignmentResult = 0.0
    private var homeworkResult = 0.0
    private var midtermResult = 0.0
    private var finalResult = 0.0
    private var gradeResult = 0.0
    
    /*-----------Change digit from the display ------------*/
    @IBAction private func touchDigit(sender: UIButton)
    {
        let digit = sender.currentTitle!
        /*-----------Changing digit------------*/
        if UserIsInTheMiddleOfTyping
        {
            let textCurrentlyDisplay = display.text!
            display.text = textCurrentlyDisplay + digit
        } else {
            display.text = digit
        }
        
        UserIsInTheMiddleOfTyping = true
    }
    
    /*-----------Reset the display Value ------------*/
    private var displayValue: Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    /*-----------Implement New Conponent from Controller ------------*/
    private var brain : calculateModel = calculateModel()
    
    @IBAction func performOpration(sender: UIButton) {
        /*UserIsInTheMiddleOfTyping = false
        if let mathmaticalSymbol = sender.currentTitle {
            if mathmaticalSymbol == "+" {
                display.text = String(M_PI)
            }
        }*/
        if UserIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            UserIsInTheMiddleOfTyping = false
        }
        if let mathmaticalSymbol = sender.currentTitle {
            brain.performanOperation(mathmaticalSymbol)
        }
        displayValue = brain.result
        
    }
    
    /*-----------Checking Assignment Mark ------------*/
    @IBAction func assignmentMark(sender: UIButton) {
        assignment.text = display.text
        assignmentResult = Double(display.text!)!
        total.text! = String(assignmentResult + homeworkResult + midtermResult + finalResult)
        gradeResult = assignmentResult + homeworkResult + midtermResult + finalResult
        if gradeResult < 0.5 {
            grade.text = "Fail"
        }
        if gradeResult >= 0.5 {
            grade.text = "Pass"
        }
    }
    
    /*-----------Checking Homework Mark ------------*/
    @IBAction func homeworkMark(sender: UIButton) {
        homework.text = display.text
        homeworkResult = Double(display.text!)!
        total.text! = String(assignmentResult + homeworkResult + midtermResult + finalResult)
        gradeResult = assignmentResult + homeworkResult + midtermResult + finalResult
        if gradeResult < 0.5 {
            grade.text = "Fail"
        }
        if gradeResult >= 0.5 {
            grade.text = "Pass"
        }
        
    }
    
    /*-----------Checking Midterm Mark ------------*/
    @IBAction func midtermMark(sender: UIButton) {
        midterm.text = display.text
        midtermResult = Double(display.text!)!
        total.text! = String(assignmentResult + homeworkResult + midtermResult + finalResult)
        gradeResult = assignmentResult + homeworkResult + midtermResult + finalResult
        if gradeResult < 0.5 {
            grade.text = "Fail"
        }
        if gradeResult >= 0.5 {
            grade.text = "Pass"
        }
    }
   
    /*-----------Checking Final Mark ------------*/
    @IBAction func finalMark(sender: UIButton) {
        final.text = display.text
        finalResult = Double(display.text!)!
        total.text! = String(assignmentResult + homeworkResult + midtermResult + finalResult)
        gradeResult = assignmentResult + homeworkResult + midtermResult + finalResult
        if gradeResult < 0.5 {
            grade.text = "Fail"
        }
        if gradeResult >= 0.5 {
            grade.text = "Pass"
        }
        
    }
    
    
    
}

