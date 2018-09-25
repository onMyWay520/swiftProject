//
//  PPYBaseTabBarController.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/25.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

class PPYBaseTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewControllers()
        let backView = UIView(frame: CGRect(x: 0, y: 0, width: ppyScreenW, height: 49))
        backView.backgroundColor = UIColor.white
        tabBar.insertSubview(backView, at: 0)
        tabBar.isOpaque = true

    }
    func addChildViewControllers(){
        setupOneChildViewController("首页", image: "home_unselect", selectedImage: "home_select", controller: PPYHomeVC.init())
        setupOneChildViewController("搜索", image: "search_unselect", selectedImage: "search_select", controller: PPYSearchVC.init())
        setupOneChildViewController("采购单", image: "shopCart_unselect", selectedImage: "shopCart_select", controller: PPYShopCartVC.init())
        setupOneChildViewController("我的", image: "mine_unselect", selectedImage: "mine_select", controller: PPYMineVC.init())
    }
    /// 添加一个子控制器
    fileprivate func setupOneChildViewController(_ title: String, image: String, selectedImage: String, controller: UIViewController) {
        
        controller.tabBarItem.title = title
        controller.title = title
        controller.tabBarItem.image = UIImage(named: image)
        controller.tabBarItem.selectedImage = UIImage(named: selectedImage)
        let naviController = PPYBaseNavigationController.init(rootViewController: controller)
        addChildViewController(naviController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
