//
//  MainTabBar.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/8.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

import UIKit

class MainTabBar: UITabBar {

    lazy var publishButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named: "tabBar_publish_icon"), for: .normal)
        button.setBackgroundImage(UIImage(named: "tabBar_publish_click_icon"), for: .highlighted)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.addTarget(self, action: #selector(clickPublishButton), for: .touchUpInside)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(publishButton)
    }
    override func layoutSubviews() {
        //调用父类的方法
        super.layoutSubviews()
        
//        if height > TABBAR_HEIGHT {
//            height = TABBAR_HEIGHT
//        }
        let btnW = KScreenWidth / 5
//        let btnH = 49
        let btnY: CGFloat = 0
        var index: CGFloat = 0
//        publishButton.center = self.ppy_center
        for view in subviews {
            if view.isKind(of: NSClassFromString("UITabBarButton")!){
                let buttonX = (index < 2) ? index * btnW : (index + 1) * btnW
                view.frame = CGRect(x: buttonX, y: btnY, width: btnW, height: 49)
                index += 1
            } else {
                view.frame = CGRect(x: 2 * btnW + (btnW - 40)/2 , y: 5, width: 40, height: 40)

            }

        }
        
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension MainTabBar {
    
    @objc fileprivate func clickPublishButton() {
        
     let publishVC = PPYPublishVC()
     UIApplication.shared.keyWindow?.rootViewController?.present(publishVC, animated: false, completion: nil)
    }
    
}
