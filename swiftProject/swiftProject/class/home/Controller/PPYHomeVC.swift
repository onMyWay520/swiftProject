//
//  PPYHomeVC.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/25.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit
private let ppyTitleViewH :CGFloat = 40
class PPYHomeVC: PPYBaseViewController {
    lazy var titles: Array = { () -> [String] in
        let titles = ["热卖","推荐","果汁","牛奶","方便面","矿泉水","功能饮料","其他"]
        return titles
    }()
    private lazy var pageTitleView: PPYPageTitleView = {
        let config = PPYPageTitleViewConfig()
        let pageTitleView = PPYPageTitleView(frame: CGRect(x: 0, y: 20, width: ppyScreenW, height: 41), titles: titles, config: config)
        pageTitleView.pageTitleViewDelegate = self
        return pageTitleView
    }()
    
    private lazy var pageContentView: PPYPageContentView = {
        var childControllers = [UIViewController]()
        for i in 0..<titles.count {
            let vc = PPYHomeChildVC()
            let collectionVC = PPYHomeCollectionVC()
            collectionVC.title=titles[i]
            if i==0 {
                 childControllers.append(vc)
            }
            else{
                 childControllers.append(collectionVC)
            }
        
        }
        
        let pageContentViewY = pageTitleView.frame.maxY
        let pageContentView = PPYPageContentView(frame: CGRect(x: 0, y: pageContentViewY, width: ppyScreenW, height: ppyScreenH-pageContentViewY), parentVC: self, childVCs: childControllers)
        pageContentView.pageContentViewDelegate = self
        return pageContentView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.white
        view.addSubview(pageTitleView)
        view.addSubview(pageContentView)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    self.navigationController?.navigationBar.isHidden = true

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    self.navigationController?.navigationBar.isHidden = false
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
}

extension PPYHomeVC : PPYPageTitleViewDelegate, PPYPageContentViewDelegate {
    func selectedIndexInPageTitleView(pageTitleView: PPYPageTitleView, selectedIndex: Int) {
     self.pageContentView.setPageContentViewCurrentIndex(currentIndex: selectedIndex)
    }
    func pageContentViewScroll(progress: CGFloat, originalIndex: Int, targetIndex: Int) {
     self.pageTitleView.setPageTitleView(progress: progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
}
