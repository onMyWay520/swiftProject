//
//  PPYBaseTableViewCell.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/26.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

import UIKit

class PPYBaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.setCellUI()
        

    }
    func setCellUI() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
