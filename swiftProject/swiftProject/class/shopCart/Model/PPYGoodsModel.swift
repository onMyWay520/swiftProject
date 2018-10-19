//
//  PPYGoodsModel.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/10.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit
import HandyJSON
class PPYGoodsModel: HandyJSON {
    required init() {
        
    }
    
    //是否已经加入购物车
    var alreadyAddShoppingCart :Bool = false
    
    //商品图片名称
    var iconName : String?
    
    //商品标题
    var title : String?
    
    //商品的描述
    var desc : String?
    
    var goodsId :  Int = 0
    
    //商品购买的数量, 默认1
    var count: Int = 1
    
    //新价格
    var newPrice : String?
    
    //老价格
    var oldPrice : String?

    //是否选中，默认没有选中的
    var selected: Bool = true
    
//    required init() {} 
//    //字典转模型  重写构造方法
//    init(dict: [String : AnyObject]) {
//        super.init()
//        //使用kvo为当前属性设置值
//        setValuesForKeys(dict)
//    }
//
//    //防止kvo赋值属性不匹配二崩溃
//    override func setValue(_ value: Any?, forUndefinedKey key: String) {}


}
