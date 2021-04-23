//
//  PPYNewsViewModel.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/22.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

import UIKit

class PPYNewsViewModel: PPYBaseViewModel {
   lazy var newsModelArray  = [PPYNewsModel]()

}
extension PPYNewsViewModel{
    func getNewsHttpData(_ finishCallback : @escaping () -> ())   {
        NetworkTools.shareInstance.requestData(methodType: .GET, urlString: "http://c.m.163.com/nc/article/list/T1348649079062/0-20.html", parameters: nil) { (result, Any) in
            print(result as Any)
            guard let resultDict = result as? [String: Any] else { return }
            //[[String : Any]] 最外面是数组,数组里面存的字典
            guard let dataArray = resultDict["T1348649079062"] as? [[String : Any]] else { return }
            //3遍历数组,取出字典,字典转模型
            for dict in dataArray {
                let model = PPYNewsModel.deserialize(from: dict)
                self.newsModelArray.append(model! )
            }
            finishCallback()
            
        }
    }
}
