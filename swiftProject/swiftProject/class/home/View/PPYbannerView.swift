//
//  PPYbannerView.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/23.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit
import LLCycleScrollView
class PPYbannerView: PPYBaseView,LLCycleScrollViewDelegate {
    func cycleScrollView(_ cycleScrollView: LLCycleScrollView, didSelectItemIndex index: NSInteger) {
        DeLog("点击的是第\(index)标题")
    }
    
    override func setUI() {
        let bannerDemo = LLCycleScrollView.llCycleScrollViewWithFrame(CGRect.init(x: 0, y: 0, width: ppyScreenW, height: 250))
         bannerDemo.imagePaths = ["http://b.hiphotos.baidu.com/zhidao/pic/item/4b90f603738da9770889666fb151f8198718e3d4.jpg","http://g.hiphotos.baidu.com/zhidao/pic/item/f2deb48f8c5494ee4e84ef5d2cf5e0fe98257ed4.jpg"]
        // 是否自动滚动
        bannerDemo.autoScroll = true
        // 是否无限循环，此属性修改了就不存在轮播的意义了
        bannerDemo.infiniteLoop = true
        bannerDemo.delegate=self
        
        
        // 滚动间隔时间(默认为2秒)
//        bannerDemo.autoScrollTimeInterval = 2.0
        // 等待数据状态显示的占位图
//        bannerDemo.placeHolderImage = UIImage.init(named: "spellDefault")
        
        // 如果没有数据的时候，使用的封面图
//        bannerDemo.coverImage = #UIImage
        
        // 设置图片显示方式=UIImageView的ContentMode
        bannerDemo.imageViewContentMode = .scaleAspectFit
        
        // 设置滚动方向（ vertical || horizontal ）
        bannerDemo.scrollDirection = .horizontal
        
        // 设置当前PageControl的样式 (.none, .system, .fill, .pill, .snake)
        bannerDemo.customPageControlStyle = .fill
        
        // 非.system的状态下，设置PageControl的tintColor
        bannerDemo.customPageControlInActiveTintColor = UIColor.red
        
        // 设置.system系统的UIPageControl当前显示的颜色
        bannerDemo.pageControlCurrentPageColor = UIColor.white
        
        // 非.system的状态下，设置PageControl的间距(默认为8.0)
        bannerDemo.customPageControlIndicatorPadding = 8.0
        
        // 设置PageControl的位置 (.left, .right 默认为.center)
        bannerDemo.pageControlPosition = .center
        
        // 背景色
//        bannerDemo.collectionViewBackgroundColor
        
        // 添加到view
        self.addSubview(bannerDemo)
        
        
    }
    

}
