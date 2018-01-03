//
//  DigitButton.swift
//  Calculator
//
//  Created by 低己 on 2018/1/3.
//  Copyright © 2018年 低己. All rights reserved.
//

import UIKit

class DigitButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.height * 0.1
        layer.masksToBounds = true
    }

}

//Button风格
