//
//  PPYHomeCollectionCell.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/27.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

class PPYHomeCollectionCell: PPYBaseCollectionViewCell {
    var titleLab:UILabel?
    var goodsImageView:UIImageView?
    override func setCollectionCellUI() {
        self.goodsImageView=UIImageView()
        self.goodsImageView?.sd_setImage(with: NSURL.init(string: "http://d.hiphotos.baidu.com/zhidao/pic/item/72f082025aafa40f507b2e99aa64034f78f01930.jpg") as URL?, placeholderImage: UIImage.init(named: "spellDefault"), options: [], progress: nil, completed: nil)
        
        self.addSubview(self.goodsImageView!)
        self.titleLab=UILabel()
        self.titleLab?.font=UIFont.systemFont(ofSize: 14)
        self.titleLab?.text="我是标题"
        self.titleLab?.textColor=UIColor(hex: "333333")
        self.titleLab?.textAlignment=NSTextAlignment.left
        self.addSubview(self.titleLab!)

    }
    override func layoutSubviews() {
        self.goodsImageView?.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.height.equalTo(ppyScreenW/2-40)
            make.width.equalTo(ppyScreenW/2-40)
            make.left.equalTo(self)
        }
        self.titleLab?.snp.makeConstraints { (make) in
            // 让顶部距离view1的底部为10的距离
        make.top.equalTo((self.goodsImageView?.snp.bottom)!).offset(10)
            // 设置宽、高
        make.height.equalTo(14)
        make.width.equalTo(200)
        make.left.equalTo((self.goodsImageView?.snp.left)!)
        }
    }
}
