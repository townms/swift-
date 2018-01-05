//
//  anniu.swift
//  button
//
//  Created by 低己 on 2018/1/5.
//  Copyright © 2018年 低己. All rights reserved.
//

import UIKit

class DigitButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.height * 0.3
        layer.masksToBounds = true
    }
    
}
