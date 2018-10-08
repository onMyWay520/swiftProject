//
//  MainTabBar.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/8.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

class MainTabBar: UITabBar {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    lazy var publishButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named: "tabBar_publish_icon"), for: .normal)
        button.setBackgroundImage(UIImage(named: "tabBar_publish_click_icon"), for: .highlighted)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
//        button.addTarget(self, action: #selector(clickPublishButton), for: .touchUpInside)
        return button
    }()

}
