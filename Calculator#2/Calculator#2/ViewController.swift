//
//  ViewController.swift
//  Calculator#2
//
//  Created by 低己 on 2018/1/3.
//  Copyright © 2018年 低己. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var urerIsIntheMiddleofTyping = false //定义一个布尔值
    
    @IBAction func touchDight(_ sender: UIButton) {
        var digit = sender.currentTitle! //接收按钮的数字
        if urerIsIntheMiddleofTyping {
            let textCurrentlyInDisplay = display.text! //把内容显示在display上
            display.text = textCurrentlyInDisplay + digit //显示的内容等于显示的加上按键的
        } else {
            display.text = digit
            urerIsIntheMiddleofTyping = true
        }
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        
        }
        set {
        display.text = String(newValue)
        }
    }
    @IBAction func performOperation(_ sender: UIButton) {
        urerIsIntheMiddleofTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "π":
                displayValue = Double.pi
            case "√": //定义平凡根
                displayValue = sqrt(displayValue)
            default:
                break
            }
        }
    }
    
    
    
}
