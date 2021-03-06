//
//  PPYHomeGoodsCell.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/26.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage
class PPYHomeGoodsCell: PPYBaseTableViewCell {
    var titleLab:UILabel?
    var goodsImageView:UIImageView?
    var desLab:UILabel?
    var priceLab:UILabel?
    var addShopCartButton:UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setCellUI() {

     self.goodsImageView=UIImageView()
     self.goodsImageView?.sd_setImage(with: NSURL.init(string: "http://d.hiphotos.baidu.com/zhidao/pic/item/72f082025aafa40f507b2e99aa64034f78f01930.jpg") as URL?, placeholderImage: UIImage.init(named: "spellDefault"), options: [], progress: nil, completed: nil)

      self.contentView.addSubview(self.goodsImageView!)
      self.titleLab=UILabel()
      self.titleLab?.font=UIFont.systemFont(ofSize: 14)
      self.titleLab?.text="我是标题"
      self.titleLab?.textColor=UIColor(hex: "333333")
      self.titleLab?.textAlignment=NSTextAlignment.left
      self.contentView.addSubview(self.titleLab!)
        
      self.desLab=UILabel()
      self.desLab?.font=UIFont.systemFont(ofSize: 12)
      self.desLab?.text="120ml*12/箱"
      self.desLab?.textColor=UIColor(hex: "666666")
      self.desLab?.textAlignment=NSTextAlignment.left
      self.contentView.addSubview(self.desLab!)
       
//        self.addShopCartButton=UIButton.buttonWith(titleColor: UIColor.white, titleFont: UIFont.systemFont(ofSize: 16), backgroundColor: defaultColor, title: "加入采购单",cornerRadius:5)
//      self.addSubview(self.addShopCartButton!)

    }
    override func layoutSubviews() {
         self.goodsImageView?.snp.makeConstraints { (make) in
            // 让顶部距离view1的底部为10的距离
            make.top.equalTo(self.contentView).offset(10)
            // 设置宽、高
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.left.equalTo(self.contentView).offset(10)
        }
//        self.contentView.cornerRadius(cornerView:self.goodsImageView!, cornerSize: 20)


         self.titleLab?.snp.makeConstraints { (make) in
            // 让顶部距离view1的底部为10的距离
            make.top.equalTo((self.goodsImageView?.snp.top)!)
            // 设置宽、高
            make.height.equalTo(14)
            make.width.equalTo(120)
            make.left.equalTo((self.goodsImageView?.snp.right)!).offset(20)
        }
        self.desLab?.snp.makeConstraints { (make) in
            // 让顶部距离view1的底部为10的距离
            make.top.equalTo((self.titleLab?.snp.bottom)!).offset(10)
            // 设置宽、高
            make.height.equalTo(14)
            make.width.equalTo(100)
            make.left.equalTo((self.titleLab?.snp.left)!)
        }
        self.addShopCartButton?.snp.makeConstraints { (make) in
            // 让顶部距离view1的底部为10的距离
            make.top.equalTo((self.desLab?.snp.bottom)!).offset(40)
            // 设置宽、高
            make.height.equalTo(30)
            make.width.equalTo(100)
            make.left.equalTo((self.titleLab?.snp.left)!)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
