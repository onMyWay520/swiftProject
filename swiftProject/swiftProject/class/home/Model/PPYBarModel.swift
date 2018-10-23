//
//  PPYBarModel.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/23.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

class PPYBarModel: NSObject {
    //卡名
    @objc dynamic var cardName : String = ""
    //
    @objc dynamic var right : String = ""
    //金额
    @objc dynamic var totalMoney : String = ""
    
    
    //定义字典转模型的构造函数
    init(dic :[String :String]) {
        super.init()
        setValuesForKeys(dic)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
