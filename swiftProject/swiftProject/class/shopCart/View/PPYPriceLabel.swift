//
//  PPYPriceLabel.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/13.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

class PPYPriceLabel: UILabel {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //获取上下文
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.move(to: CGPoint(x: 0, y: rect.height * 0.5))
        ctx?.addLine(to: CGPoint(x: rect.width, y: rect.height * 0.5))
        ctx?.strokePath()
    }

}
