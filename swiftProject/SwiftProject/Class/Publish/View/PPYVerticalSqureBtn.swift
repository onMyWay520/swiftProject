//
//  PPYVerticalSqureBtn.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/9.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

import UIKit

class PPYVerticalSqureBtn: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageViewWH: CGFloat = 50
        let margin: CGFloat = 10
        imageView?.frame = CGRect(x: ppy_center.x - imageViewWH / 2.0, y: margin, width: imageViewWH, height: imageViewWH)
        
        titleLabel?.frame = CGRect(x: 0, y: imageViewWH + margin, width: frame.width, height: frame.height - imageViewWH - margin)
    }
    

}
extension PPYVerticalSqureBtn {
    fileprivate func setupUI(){
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: 13)
        titleLabel?.adjustsFontSizeToFitWidth = true
    }
}
