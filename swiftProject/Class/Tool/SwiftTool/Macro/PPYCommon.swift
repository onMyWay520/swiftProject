//
//  PPYCommon.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/25.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

import UIKit
let KScreenWidth = UIScreen.main.bounds.width
let KScreenHeight = UIScreen.main.bounds.height
let SCREEN_MAX_LENGTH  = max(KScreenWidth, KScreenHeight)
let IS_IPHONE_4_OR_LESS = SCREEN_MAX_LENGTH < 568.0
let IS_IPHONE_5 = SCREEN_MAX_LENGTH == 568.0
let IS_IPHONE_6 = SCREEN_MAX_LENGTH == 667.0
let IS_IPHONE_6P = SCREEN_MAX_LENGTH == 736.0
// 判断iPhone X
let Device_Is_iPhoneX = __CGSizeEqualToSize(CGSize.init(width: 1125/3, height: 2436/3), UIScreen.main.bounds.size)
//判断iPHoneXr | 11
let Device_Is_iPhoneXr = __CGSizeEqualToSize(CGSize.init(width: 828/2, height: 1792/2), UIScreen.main.bounds.size)
//判断iPHoneXs | 11Pro
let Device_Is_iPhoneXs = __CGSizeEqualToSize(CGSize.init(width: 1125/3, height: 2436/3), UIScreen.main.bounds.size)
//判断iPhoneXs Max | 11ProMax
let Device_Is_iPhoneXs_Max = __CGSizeEqualToSize(CGSize.init(width: 1242/3, height: 2688/3), UIScreen.main.bounds.size)

let Device_Is_iphoneX_All = (Device_Is_iPhoneX || Device_Is_iPhoneXr || Device_Is_iPhoneXs||Device_Is_iPhoneXs_Max)
//判断iPhone12_Mini
let Device_Is_iPhone12_Mini = __CGSizeEqualToSize(CGSize.init(width: 1080/3, height: 2340/3), UIScreen.main.bounds.size)
//判断iPhone12 | 12Pro
let Device_Is_iPhone12 = __CGSizeEqualToSize(CGSize.init(width: 1170/3, height: 2532/3), UIScreen.main.bounds.size)
//判断iPhone12 Pro Max
let Device_Is_iPhone12_ProMax = __CGSizeEqualToSize(CGSize.init(width: 1284/3, height: 2778/3), UIScreen.main.bounds.size)
//x系列，包含x、11、12
let Device_Is_iPhone_All = (Device_Is_iphoneX_All||Device_Is_iPhone12_Mini||Device_Is_iPhone12||Device_Is_iPhone12_ProMax)
//判断iPad
let IPAD_DEV:Bool! = (UIDevice.current.userInterfaceIdiom == .pad) ? true : false
let STATUS_NAV_BAR_Y:CGFloat = Device_Is_iPhone_All ? 88.0 : 64.0
let TABBAR_HEIGHT:CGFloat = Device_Is_iPhone_All ? 83.0 : 49.0
let STATUSBAR_HEIGHT:CGFloat = Device_Is_iPhone_All ? 44.0 : 20.0
let DefaultColor = UIColor(hex: "2a7fd5")
let DefaultTitleColor = UIColor(hex: "666666")
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
    return size * KScreenWidth / 375.0
}
// 自适应屏幕高度
func HEIGHT(_ size: CGFloat) -> CGFloat {
    return size * KScreenHeight / 667.0
}
// 自适应屏幕字体大小
func AUTO_FONT(_ size: CGFloat) -> UIFont {
    let autoSize = size * KScreenWidth / 375.0
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
