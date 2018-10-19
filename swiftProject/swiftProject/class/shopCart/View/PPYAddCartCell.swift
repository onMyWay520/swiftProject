//
//  PPYAddCartCell.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/10.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit
import SnapKit
//使用代理传输数据
protocol PPYAddCartCellDelegate :NSObjectProtocol {
    
    //代理方法
    func clickTransmitData(_ cell:PPYAddCartCell ,icon: UIImageView)
}
class PPYAddCartCell: PPYBaseTableViewCell {
    weak var delegate: PPYAddCartCellDelegate?
    /// 商品模型
    var goodModel : PPYGoodsModel? {
        //属性监视
        didSet {
            if let iconName  = goodModel?.iconName {
                goodsImageView.image = UIImage(named: iconName)
            }
            
            if let title = goodModel?.title {
                titleLab.text = title
            }
            
            if let desc = goodModel?.desc {
                desLab.text = desc
            }
        
        }
    }
    override func setCellUI() {
        contentView .addSubview(goodsImageView)
        contentView.addSubview(titleLab)
        contentView.addSubview(desLab)
        addShopCartButton.addTarget(self, action: #selector(addCarButtonClick), for:UIControlEvents.touchUpInside )
        contentView.addSubview(addShopCartButton)
    }
    override func layoutSubviews() {
        goodsImageView.snp.makeConstraints { (make) in
            // 让顶部距离view1的底部为10的距离
            make.top.equalTo(self).offset(10)
            // 设置宽、高
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.left.equalTo(self).offset(10)
        }
        titleLab.snp.makeConstraints { (make) in
            // 让顶部距离view1的底部为10的距离
            make.top.equalTo((goodsImageView.snp.top))
            // 设置宽、高
            make.height.equalTo(14)
            make.width.equalTo(120)
            make.left.equalTo((goodsImageView.snp.right)).offset(20)
        }
      desLab.snp.makeConstraints { (make) in
            // 让顶部距离view1的底部为10的距离
            make.top.equalTo((titleLab.snp.bottom)).offset(10)
            // 设置宽、高
            make.height.equalTo(14)
            make.width.equalTo(150)
            make.left.equalTo((titleLab.snp.left))
        }
        self.addShopCartButton.snp.makeConstraints { (make) in
            // 让顶部距离view1的底部为10的距离
            make.top.equalTo(self).offset(20)
            // 设置宽、高
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.right.equalTo(self).offset(-20)
        }
    }
    // MARK: - 属性懒加载
    fileprivate lazy var goodsImageView: UIImageView = {
        let goodsImageView = UIImageView()
        goodsImageView.image=UIImage(named: "goods_01")
        //圆角
        goodsImageView.layer.cornerRadius = 30
        //裁剪模式
        goodsImageView.layer.masksToBounds = true
        return goodsImageView
    }()
    //商品标题
    fileprivate lazy var titleLab: UILabel = {
        let titleLab = UILabel()
        titleLab.text="1234"
        return titleLab
    }()
    
    //商品描述
    fileprivate lazy var desLab: UILabel = {
        let desLab  = UILabel()
        desLab.text="56789"
        desLab.textColor = UIColor.gray
        return desLab
    }()
    fileprivate lazy var addShopCartButton: UIButton = {
        let addShopCartButton  = UIButton.buttonWith(imageName:"addShopCart")
        return addShopCartButton
    }()
    
    /// 购买按键的点击  private私有方法
    @objc fileprivate func addCarButtonClick(_ btn:UIButton) {
        //传输值
        delegate?.clickTransmitData(self, icon: self.goodsImageView)
        
    }
}
