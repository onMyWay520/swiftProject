//
//  UIView+Extension.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/25.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

extension UIView {
    
    var x: CGFloat {
        get{
            return frame.origin.x
        }
        set(newValue){
            frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get{
            return frame.origin.y
        }
        set(newValue){
            frame.origin.y = newValue
        }
    }
    
    //自身中心点
    var ppy_center: CGPoint {
        
        get {
            return CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0)
        }
        set {
            center = CGPoint(x: newValue.x, y: newValue.y)
        }
        
    }
    var centerX: CGFloat {
        get{
          return center.x
        }
        set(newValue){
           center.x = newValue
        }
    }
    
    var centerY: CGFloat {
        get{
          return center.y
        }
        set(newValue){
            center.y = newValue
        }
    }
    
    var width: CGFloat {
        get{
            return frame.size.width
        }
        set(newValue){
            frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get{
            return frame.size.height
        }
        set(newValue){
            frame.size.height = newValue
        }
    }
    
    var size: CGSize {
        get{
            return bounds.size
        }
        set(newValue){
            frame.size = newValue
        }
    }
    
    var origin: CGPoint {
        get{
            return frame.origin
        }
        set(newValue){
            frame.origin = newValue
        }
    }
    func cornerRadius(cornerView: UIView , cornerSize:Int) {
        
        let rect = cornerView.bounds
        let radio = CGSize(width: cornerSize, height: cornerSize) // 圆角尺寸
        let corner = UInt8(UIRectCorner.topLeft.rawValue) | UInt8(UIRectCorner.topRight.rawValue) | UInt8(UIRectCorner.bottomLeft.rawValue) | UInt8(UIRectCorner.bottomRight.rawValue)// 这只圆角位置
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner(rawValue: UIRectCorner.RawValue(corner)), cornerRadii: radio)
        let masklayer = CAShapeLayer() // 创建shapelayer
        masklayer.frame = cornerView.bounds
        masklayer.path = path.cgPath // 设置路径
        cornerView.layer.mask = masklayer
    }
    
}
