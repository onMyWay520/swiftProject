//
//  PPYBaseCollectionViewCell.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/27.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

import UIKit

class PPYBaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCollectionCellUI()
    }
    func setCollectionCellUI(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
