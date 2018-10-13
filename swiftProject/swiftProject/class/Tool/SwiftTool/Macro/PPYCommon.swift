//
//  PPYCommon.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/25.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit
let ppyScreenW = UIScreen.main.bounds.width
let ppyScreenH = UIScreen.main.bounds.height
let SCREEN_MAX_LENGTH  = max(ppyScreenW, ppyScreenH)
let IS_IPHONE_4_OR_LESS = SCREEN_MAX_LENGTH < 568.0
let IS_IPHONE_5 = SCREEN_MAX_LENGTH == 568.0
let IS_IPHONE_6 = SCREEN_MAX_LENGTH == 667.0
let IS_IPHONE_6P = SCREEN_MAX_LENGTH == 736.0
let IS_IPHONE_X = SCREEN_MAX_LENGTH == 812.0
let STATUS_NAV_BAR_Y:CGFloat = IS_IPHONE_X == true ? 88.0 : 64.0
let TABBAR_HEIGHT:CGFloat = IS_IPHONE_X == true ? 83.0 : 49.0
let STATUSBAR_HEIGHT:CGFloat = IS_IPHONE_X == true ? 44.0 : 20.0

let ppyStatusBarH: CGFloat = 20
let ppyNavigationBarH: CGFloat = 44
let ppyTabBarH: CGFloat = 49
let defaultColor = UIColor(hex: "2a7fd5")
let defaultTitleColor = UIColor(hex: "666666")
let DarkBlackColor = UIColor(hex: "666666")
let DEFAULT_CHILDVCS: String = "default" // 首页初始化的子控制器
let HOME_CHILDVCS: String = "childvcs" // 首页contentView中的子控制器
// 当前系统版本
let ppyVersion = (UIDevice.current.systemVersion as NSString).floatValue

// MARK:- 自定义打印方法
func DeLog<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
    
    let fileName = (file as NSString).lastPathComponent
    
    print("\(fileName):(\(lineNum))-\(message)")
    
    #endif
}
class PPYCommon: NSObject {

}
