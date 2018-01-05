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
    //下面语句只负责类型转换，不参与计算
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
        display.text = String(newValue)
        }
    }
    private var brain = 计算器大脑()
    @IBAction func performOperation(_ sender: UIButton) {
        if urerIsIntheMiddleofTyping {
            brain.setOperand(displayValue)
            urerIsIntheMiddleofTyping = false
        }
        
        //取得计算器运算的符号
        //需要通知大脑
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOpeartion(mathematicalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
    }
}

extension ViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
                return .lightContent
//        return .default
    }
    
}
