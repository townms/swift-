//
//  CalculatoBrain.swift
//  Calculator#2
//
//  Created by 低己 on 2018/1/3.
//  Copyright © 2018年 低己. All rights reserved.
// 定义模型

import Foundation
//定义取反的结果
func 取反(operand: Double) -> Double {
    return -operand
}
//定义*的结果
//func multiply(op1: Double,op2: Double) -> Double {
//    return op1 * op2
//}

struct 计算器大脑 {
    
    
    private var accmulator: Double?
    
    private enum Operation {
//        case AC1((Double) -> Int)
        case constant(Double)
        case unaryOpearion((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equals
        
    }
    private var optionals: Dictionary<String,Operation> = [
        "π": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "√": Operation.unaryOpearion(sqrt),
        "cos": Operation.unaryOpearion(cos),
        "±": Operation.unaryOpearion(取反),
        "×": Operation.binaryOperation( {$0 * $1 }), //multiply 闭包写法
        "÷": Operation.binaryOperation( {$0 / $1 }),
        "+": Operation.binaryOperation( {$0 + $1 }),
        "-": Operation.binaryOperation( {$0 - $1 }),
        "=": Operation.equals,
        "AC": Operation.constant(0)
        
    ]
    mutating func performOpeartion(_ symol: String) {
        if let operation = optionals[symol] {
            switch operation {
            case .constant(let value):
                accmulator = value
//                pbo = nil //可删除，判断挂起操作
            case .unaryOpearion(let function):
                if accmulator != nil {
                 accmulator = function(accmulator!)
                }
            case .binaryOperation(let function):
                if accmulator != nil {
                    pbo = pendingBinaryOperation    (function: function, firstOperand: accmulator!)
                    accmulator = nil
                }
            case .equals:
             performPendingBinaryOperation()
//            case .AC1(_):
//                accmulator = 0
            
            }
        }
    }
    mutating func setOperand(_ operand: Double) {
        accmulator = operand
    }
    var result: Double? {
        get {
            return accmulator
        }
    }
    private mutating func performPendingBinaryOperation() {
        if pbo != nil && accmulator != nil {
       accmulator = pbo?.perform(with: accmulator!)
            pbo = nil
        }
    }
    
    private var pbo: pendingBinaryOperation?
    
    private struct pendingBinaryOperation {
        let function: (Double,Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
}
//private mutating func PendingBinonaryOperation() {
//    if PendingBinonaryOperation != nil && accmulator != nil {
//        accmulator = PendingBinonaryOperation!.perform(with:accmulator!)
//        PendingBionaryOperation = nil
//    }
//}
//    private var PendingBinonaryOperation: PendingBionaryOperation?
//
//    private struct PendingBionaryOperation {
//        let function: (Double,Double) -> Double
//        let firstOperand: Double
//        func perform(with secondOperand: Double) -> Double{
//            return function(firstOperand,secondOperand)
//        }
//    }
//    mutating func setoperand(_ operand: Double){
//       accmulator = operand
//    }
//
//    var result: Double? {
//        get {
//            return accmulator //缺省值可以让输入完数字后等待
//        }
//    }
//

