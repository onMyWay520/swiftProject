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
//判断iPad
let IPAD_DEV:Bool! = (UIDevice.current.userInterfaceIdiom == .pad) ? true : false
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
// 自适应屏幕宽度
func WIDTH(_ size: CGFloat) -> CGFloat {
    return size * ppyScreenW / 375.0
}
// 自适应屏幕高度
func HEIGHT(_ size: CGFloat) -> CGFloat {
    return size * ppyScreenH / 667.0
}
// 自适应屏幕字体大小
func AUTO_FONT(_ size: CGFloat) -> UIFont {
    let autoSize = size * ppyScreenW / 375.0
    return UIFont.systemFont(ofSize: autoSize)
}

/// 通过 red 、 green 、blue 、alpha 颜色数值
public let RGBA:((Float,Float,Float,Float) -> UIColor ) = { (r: Float, g: Float , b: Float , a: Float ) -> UIColor in
    return UIColor.init(red: CGFloat(CGFloat(r)/255.0), green: CGFloat(CGFloat(g)/255.0), blue: CGFloat(CGFloat(b)/255.0), alpha: CGFloat(a))
}
/// 根据imageName创建一个UIImage
public let imageNamed:((String) -> UIImage? ) = { (imageName : String) -> UIImage? in
    return UIImage.init(named: imageName)
}
// 时间戳转日期
func timeStampToString(timeStamp:String,format:String)->String {
    let string = NSString(string: timeStamp)
    let timeSta:TimeInterval = string.doubleValue
    let dfmatter = DateFormatter()
    dfmatter.dateFormat = format
    let date = NSDate(timeIntervalSince1970: timeSta)
    return dfmatter.string(from: date as Date)
}
class PPYCommon: NSObject {

}
