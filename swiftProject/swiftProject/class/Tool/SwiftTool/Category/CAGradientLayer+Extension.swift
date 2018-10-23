//
//  CAGradientLayer+Extension.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/23.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    //获取彩虹渐变层
    func rainbowLayer() -> CAGradientLayer {
        //定义渐变的颜色（
        let gradientColors = [UIColor(r: 240, g: 90, b: 46).cgColor,  UIColor(r: 251, g: 113, b: 47).cgColor]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        return self
    }
}

