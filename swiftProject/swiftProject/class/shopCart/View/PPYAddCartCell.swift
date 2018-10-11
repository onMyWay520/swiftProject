//
//  PPYAddCartCell.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/10.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage
//使用代理传输数据
protocol PPYAddCartCellDelegate :NSObjectProtocol {
    
    //代理方法
    func clickTransmitData(_ cell:PPYAddCartCell ,icon: UIImageView)
}
class PPYAddCartCell: PPYBaseTableViewCell {
    weak var delegate: PPYAddCartCellDelegate?
    var titleLab:UILabel?
    var goodsImageView:UIImageView?
    var desLab:UILabel?
    var priceLab:UILabel?
    var addShopCartButton:UIButton?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setCellUI() {
        
        self.goodsImageView=UIImageView()
        self.goodsImageView?.sd_setImage(with: NSURL.init(string: "http://d.hiphotos.baidu.com/zhidao/pic/item/72f082025aafa40f507b2e99aa64034f78f01930.jpg") as URL?, placeholderImage: UIImage.init(named: "spellDefault"), options: [], progress: nil, completed: nil)
        self.addSubview(self.goodsImageView!)
        self.titleLab=UILabel()
        self.titleLab?.font=UIFont.systemFont(ofSize: 14)
        self.titleLab?.text="我是标题"
        self.titleLab?.textColor=UIColor(hex: "333333")
        self.titleLab?.textAlignment=NSTextAlignment.left
        self.addSubview(self.titleLab!)
        
        self.desLab=UILabel()
        self.desLab?.font=UIFont.systemFont(ofSize: 12)
        self.desLab?.text="120ml*12/箱"
        self.desLab?.textColor=UIColor(hex: "666666")
        self.desLab?.textAlignment=NSTextAlignment.left
        self.addSubview(self.desLab!)
        
        self.addShopCartButton=UIButton.buttonWith(imageName:"addShopCart")
        addShopCartButton?.addTarget(self, action: #selector(addCarButtonClick), for:UIControlEvents.touchUpInside )
        self.addSubview(self.addShopCartButton!)
    }
    override func layoutSubviews() {
        self.goodsImageView?.snp.makeConstraints { (make) in
            // 让顶部距离view1的底部为10的距离
            make.top.equalTo(self).offset(10)
            // 设置宽、高
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.left.equalTo(self).offset(10)
        }
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
            make.top.equalTo(self).offset(20)
            // 设置宽、高
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.right.equalTo(self).offset(-20)
        }
    }
    /// 购买按键的点击  private私有方法
    @objc fileprivate func addCarButtonClick(_ btn:UIButton) {
//        goodModel!.alreadyAddShoppingCArt = true
        
        //        btn.isEnabled = !goodModel!.alreadyAddShoppingCArt
        //传输值
        delegate?.clickTransmitData(self, icon: self.goodsImageView!)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
