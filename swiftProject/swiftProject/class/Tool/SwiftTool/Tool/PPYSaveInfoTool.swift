//
//  PPYSaveInfoTool.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/20.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

class PPYSaveInfoTool: NSObject {
    func writeInfo(info: Array<Dictionary<String, Any>>) {
        let defaults = UserDefaults.standard
        let data: NSData = NSKeyedArchiver.archivedData(withRootObject: info) as NSData
        defaults.set(data, forKey: "userInfo.plist")
        defaults.synchronize()
    }
    func readInfo() -> Array<Dictionary<String, Any>> {
        let defaults = UserDefaults.standard
        let data = defaults.object(forKey: "userInfo.plist")
        if data != nil {
            
            let ary = NSKeyedUnarchiver.unarchiveObject(with:data as! Data)! as! Array<Any>
            return ary as! Array<Dictionary<String, Any>>
        }
        else{
            
            return []
        }
    }

}
