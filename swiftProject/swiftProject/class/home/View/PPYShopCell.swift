//
//  PPYShopCell.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/27.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit
import Alamofire
class PPYShopCell: PPYBaseCollectionViewCell {
    var goodsImageView:UIImageView?
    override func setCollectionCellUI() {
        self.goodsImageView=UIImageView()
        self.addSubview(self.goodsImageView!)
 
    }
    var shop : PPYShopModel! {
        didSet{
          weak var weakVC = self
          DispatchQueue.global(qos: .unspecified).async {
    Alamofire.request((weakVC?.shop.img!)!,method:HTTPMethod.get,parameters:nil,encoding:URLEncoding.default,headers:nil).responseData { (response) in
                    
              if response.error == nil {
               if let data = response.data
               {
               let image = UIImage(data: data)
               weakVC?.goodsImageView!.image = image
                
                }
              }
              else{
                    print("失败")
                  }
                }
            }
        }
    }
    override func layoutSubviews() {
        goodsImageView?.frame=CGRect(x: 0, y: 0, width: width, height: height)

    }
    
    
}
