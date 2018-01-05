//
//  DigitButton.swift
//  Calculator#2
//
//  Created by 低己 on 2018/1/4.
//  Copyright © 2018年 低己. All rights reserved.
//

import UIKit

class DightUIButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.height * 1
        layer.masksToBounds = true
    }
}
