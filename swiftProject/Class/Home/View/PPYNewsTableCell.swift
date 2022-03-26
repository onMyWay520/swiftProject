//
//  PPYNewsTableCell.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/22.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

import UIKit
import SDWebImage
class PPYNewsTableCell: PPYBaseTableViewCell {
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var replayLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.none

    }
    var newModel :PPYNewsModel?{
        didSet{
            titleLabel.text=newModel?.title
            sourceLabel.text=newModel?.source
            replayLabel.text="\(newModel?.replyCount ?? 0)跟帖 "
            iconImg.layer.cornerRadius=30
            iconImg?.sd_setImage(with: NSURL.init(string: newModel?.imgsrc ?? "") as URL?, placeholderImage: UIImage.init(named: "spellDefault"), options: [], progress: nil, completed: nil)
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
