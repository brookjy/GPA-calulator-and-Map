//
//  calculateModel.swift
//  thinkingcat
//
//  Created by Yi Jin on 2017-03-11.
//  Copyright © 2017 Yi Jin. All rights reserved.
//

import Foundation

enum Optional<T>{
    case None
    case Some(T)
}

/*-----------Multiple ------------*/
func multiply (op1: Double, op2:Double) ->Double {
    return op1 * op2
}

/*-----------Add ------------*/
func add (op1: Double, op2:Double) ->Double {
    return op1 + op2
}

/*-----------Divid ------------*/
func divid (op1: Double, op2:Double) ->Double {
    return op1/op2
}

/*-----------Subtract ------------*/
func subtract (op1: Double, op2:Double) ->Double {
    return op1-op2
}

/*-----------Inverse ------------*/
func inverse (op1: Double) ->Double {
    return -op1
}


class calculateModel{
    
    /*-----------Init ------------*/
    private var accumulator = 0.0
    
    func setOperand(operand: Double){
        accumulator = operand
    }
    
    enum Operation {
        case Constant(Double)
        case otherOperation((Double)->Double)
        case binaryOpration((Double,Double)->Double)
        case Equals
    }
    
    /*-----------Operand and Operation ------------*/
    var operations : Dictionary<String,Operation> = [
        "+" : Operation.binaryOpration(add),
        "±" : Operation.otherOperation(inverse),
        "-" : Operation.binaryOpration(subtract),
        "×" : Operation.binaryOpration(multiply),
        "÷" : Operation.binaryOpration(divid),
        "=" : Operation.Equals
        
    ]
    
    /*-----------Determine the Operation and the Operand, and form action------------*/
    func performanOperation(symbol:String){
        if let operation = operations[symbol] {
            switch operation{
            case .Constant(let value) : accumulator = value
            case .otherOperation(let function): accumulator = function(accumulator)
            case .binaryOpration(let function): pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                if pending != nil {
                    accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
                    pending = nil
                }
            }
        
        }
    }
    
    /*-----------Init pending------------*/
    private var pending : PendingBinaryOperationInfo?
    
    struct PendingBinaryOperationInfo {
        var binaryFunction: (Double,Double)->Double
        var firstOperand:Double
    }
    
    /*-----------Get result------------*/
    var result: Double{
        get {
            return accumulator
        }
    }
    
}