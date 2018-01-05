//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by 低己 on 2018/1/3.
//  Copyright © 2018年 低己. All rights reserved.
//
//  计算器的视图窗口
import UIKit //载入UI

class CalculatorViewController: UIViewController {
//显示窗口的选项，并设置为只读模式，输出结果为Double类型
    @IBOutlet weak var displayVlaueOutlet: UILabel!
    var displayValue: Double {
        get {
            return Double(displayVlaueOutlet.text!)! //强制解包为Double类型
        }
        set {
            if Double(Int(newValue)) == newValue { //判断输出结果
                displayVlaueOutlet.text = String(Int(newValue))
            }else {
                displayVlaueOutlet.text = String(newValue)
            }
        }
    }
    
    var brain = 计算机大脑()
    
    var userIsInTyping: Bool = false  //判断下方语句是否成立

    @IBAction func touchDigit(_ sender: UIButton) { //数字按钮的链接
        
        let digit = sender.currentTitle!
        let textCurrentInDisplay = displayVlaueOutlet.text!
        // 如果正在输入中
        if userIsInTyping {
            if digit == "0" && textCurrentInDisplay == "0" { //如果按键=0，那就显示0，
                displayVlaueOutlet.text = "0"
            }
            else {   //否者显示 显示的内容加上按键的内容
                displayVlaueOutlet.text = textCurrentInDisplay + digit
            }
        }
        else { //如果按键为.那么显示的内容就为0.，否者就为单独的.
            
            if digit == "." {
                displayVlaueOutlet.text = "0."
            } else {
                displayVlaueOutlet.text = digit  //
            }
            userIsInTyping = true  //并且设置用户输入为true 执行if 语句
        }
    }
    
    
    @IBAction func performOperation(_ sender: UIButton) {
        // 1. 设置操作数
        if userIsInTyping {
            brain.setOperand(displayValue)
            // 设置完错作符之后，需要接受第二个操作数
            userIsInTyping = false
        }
        // 2.执行计算
        brain.performOperation(sender.currentTitle!)
        
        // 3.获取结果
        if let result = brain.result {
            displayValue = result
        }
    }
    
}


extension CalculatorViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
//        return .default
    }
   
}


