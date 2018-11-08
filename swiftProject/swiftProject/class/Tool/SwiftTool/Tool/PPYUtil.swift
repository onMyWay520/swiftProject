//
//  PPYUtil.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/15.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

class PPYUtil: NSObject {
    /// 快速创建 Label,设置文本, 文本颜色,Font,文本位置
    class func createLabel(text : String? , textColor : UIColor?, font : UIFont?, textAlignment : NSTextAlignment = .left ) -> UILabel {
        
        let label = UILabel()
        label.text = text
        if (textColor != nil) { label.textColor = textColor }
        if (font != nil) { label.font = font }
        label.textAlignment = textAlignment
        return label
    }
      /// 快速创建 TextField,设置文本, 文本颜色,Font,文本位置
    class func createTextFieldWith(Frame frame:CGRect, BoardStyle boardStyle:UITextBorderStyle, PlaceHolder placeHolder:String?, BackgroundColor backgroundColor:UIColor?, TintColor tintColor:UIColor?, IsPWD isPwd:Bool) -> UITextField{
        let textField = UITextField(frame: frame)
        textField.borderStyle = boardStyle
        if placeHolder != nil {
            textField.placeholder = placeHolder
        }
        if backgroundColor != nil {
            textField.backgroundColor = backgroundColor
        }
        if tintColor != nil {
            textField.tintColor = tintColor
        }
        textField.clearButtonMode = .always
        if isPwd {
            textField.isSecureTextEntry = true
        }
        return textField
    }
     /// 快速创建 imageView
    class func createImageViewWith(Frame frame:CGRect, ImageName imageName:String, CornarRadius radius:Float) -> UIImageView{
        let imageView = UIImageView(frame:frame)
        imageView.image = UIImage(named:imageName)
        imageView.layer.cornerRadius = CGFloat(radius)
        return imageView
    }
    
    class func createViewWith(Frame frame:CGRect, BackgroundColor backgroundColor:UIColor?) -> UIView{
        let view = UIView(frame:frame)
        if backgroundColor != nil {
            view.backgroundColor = backgroundColor
        }
        return view
    }
    
    class func SET_USER_DEFAULTS(Key key:String, Value value:Any){
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func GET_USER_DEFAULTS(Key key:String) -> Any?{
        return UserDefaults.standard.value(forKey:key) ?? ""
    }
    
    //MD5加密
    class func md5(Str str:String) -> String{
        let cStr = str.cString(using: String.Encoding.utf8)
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
    
    //base64加密
    class func encodingBase64(String str:String) -> String{
        let data = str.data(using: String.Encoding.utf8)
        return (data?.base64EncodedString(options: .lineLength64Characters))!
    }
    
    //将当前时间转换成毫秒时间
    class func changeNowDateToTimeStamp() -> Int{
        return Int(Date().timeIntervalSince1970)
    }
    
    //判断手机号码合法性
    class func isValid(MobilePhone phone:String) -> Bool {
        if phone.count != 11 {
            return false
        }
        
        let  CM = "(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
        let  CU = "(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
        let  CT = "(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
        
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        
        if regextestcm.evaluate(with: phone) || regextestct.evaluate(with: phone) || regextestcu.evaluate(with: phone){
            return true
        }else{
            return false
        }
    }
    
    //判断字符串条件 1:数字 2:英文 3:符合的英文+数字
    class func isHaveNumAndLetter(String string:String) -> Int {
        do {
            let tNumRegularExpression =  try NSRegularExpression.init(pattern: "[0-9]", options: .caseInsensitive)
            let tNumMatchCount:Int = tNumRegularExpression.numberOfMatches(in: string, options: .reportProgress, range: NSMakeRange(0, string.count))
            
            let tLetterRegularExpression = try NSRegularExpression.init(pattern: "[A-Za-z]", options: .caseInsensitive)
            let tLetterMatchCount:Int = tLetterRegularExpression.numberOfMatches(in: string, options: .reportProgress, range: NSMakeRange(0, string.count))
            
            if tNumMatchCount == string.count {
                return 1
            }
            else if tLetterMatchCount == string.count {
                return 2
            }
            else if tNumMatchCount + tLetterMatchCount == string.count {
                return 3
            }
            else{
                return 4
            }
        }catch{return 0}
    }
    
    //判断字符串是否存在
    class func isBlankString(String string:String?) -> String{
        if nil == string{
            return ""
        }
        
        return string!
    }
    
    //富文本
    class func changeToAttributeStringWith(String string:String, IndexOfString index:Int, LengthOfString length:Int,  StringFont font:CGFloat, StringColor color:UIColor) -> NSMutableAttributedString{
        let attriString = NSMutableAttributedString(string: string)
        attriString.addAttribute(.font, value: UIFont.systemFont(ofSize: font), range: NSMakeRange(index, length))
        attriString.addAttribute(.foregroundColor, value: color, range: NSMakeRange(index, length))
        return attriString
    }
    // 把一个字典转为一个Json字符串
    func toJSONString(dict:NSDictionary!)->NSString{
        if (!JSONSerialization.isValidJSONObject(dict)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: dict, options: []) as NSData
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString!
    }
    // 得到当前的时间戳
    func getCurrentTimeStamp() ->String {
        //获取当前时间
        let now = Date()
        // 创建一个日期格式器
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        print("当前日期时间：\(dformatter.string(from: now))")
        //当前时间的时间戳
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        print("当前时间的时间戳：\(timeStamp)")
        let fininalSring = "\(timeStamp)"
        return fininalSring
    }

}
