 //
//  Faceview.swift
//  Face
//
//  Created by 低己 on 2018/1/7.
//  Copyright © 2018年 低己. All rights reserved.
//

import UIKit

class Faceview: UIView {
    
    var scale: CGFloat = 0.9
    var eyesOpen: Bool = true
    
    private var skullRadius: CGFloat {
        return min(bounds.size.width,bounds.size.width) / 2 * scale
    }
    private var skullCenter: CGPoint {
        return  CGPoint(x: bounds.midX, y: bounds.midY)
        
    }
    private enum Eye {
        case 左
        case 右
    }
    //眼睛
    private func pathForEye(_ eye: Eye) -> UIBezierPath

    {
        func centerOfEye(_ eye: Eye) -> CGPoint {
            let eyeOffset = skullRadius / Retios.skullRadiusToEyeOffset
            var eyeCenter = skullCenter
            eyeCenter.y -= eyeOffset
            eyeCenter.x += ((eye == .左) ? -1 : 1) * eyeOffset
            return eyeCenter
        }
        let eyeRadius = skullRadius / Retios.skullRadiusToEyeRadius
        let eyeCenter = centerOfEye(eye)
        
        let path: UIBezierPath
        if eyesOpen {
            
            path = UIBezierPath(arcCenter: eyeCenter, radius: eyeRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        } else {
            path = UIBezierPath()
            path.move(to: CGPoint(x: eyeCenter.x - eyeRadius, y: eyeCenter.y))
            path.addLine(to: CGPoint(x: eyeCenter.x + eyeRadius, y: eyeCenter.y))
        }
        path.lineWidth = 5.0
        return path

    }
    private func pathForskull() -> UIBezierPath
    {
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        path.lineWidth = 5.0
        return path
    }
    override func draw(_ rect: CGRect) {
        UIColor.red.set()
        pathForEye(.左).stroke()
        pathForEye(.右).stroke()


 }
 private struct Retios {
    static let skullRadiusToEyeOffset: CGFloat = 3
    static let skullRadiusToEyeRadius: CGFloat = 10
    static let skullRadiusToMouthWidth: CGFloat = 1
    static let skullRadiusToMouthHeight: CGFloat = 3
    static let skullRadiusToMouthOffset: CGFloat = 3
 }

}


