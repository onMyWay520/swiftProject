//
//  PPYBaseNavigationController.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/25.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

class PPYBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
//     UINavigationBar.appearance().barTintColor =
       //背景色，导航条背景色
  self.interactivePopGestureRecognizer?.delegate = nil

    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count<1 {
            viewController.navigationItem.rightBarButtonItem=setRightButton()
        }
        else {
        
      viewController.hidesBottomBarWhenPushed = true
   viewController.navigationItem.leftBarButtonItem = setBackBarButtonItem()
        }
        super.pushViewController(viewController, animated: true)
    }
        /// 设置导航栏右边按钮
        func setRightButton() -> UIBarButtonItem {
            
            let searchItem = UIButton.init(type: .custom)
            searchItem.setImage(UIImage(named: ""), for: .normal)
            searchItem.sizeToFit()
            searchItem.frame.size = CGSize(width: 30, height: 30)
            searchItem.contentHorizontalAlignment = .right
            searchItem.addTarget(self, action: #selector(PPYBaseNavigationController.rightButtonClick), for: UIControlEvents.touchUpInside)
            return UIBarButtonItem.init(customView: searchItem)
        }
    // MARK: - private method
    func setBackBarButtonItem() -> UIBarButtonItem {
        
        let backButton = UIButton.init(type: .custom)
        backButton.setImage(UIImage(named: "setting_back"), for: .normal)
        backButton.sizeToFit()
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        backButton.addTarget(self, action: #selector(PPYBaseNavigationController.backClick), for: UIControlEvents.touchUpInside)
        return UIBarButtonItem.init(customView: backButton)
    }
    /// 点击右边的搜索
   @objc private func rightButtonClick() {
//        let searchvc = SearchVC()
//        self.pushViewController(searchvc, animated: true)
    }
    
    /// 返回
   @objc private func backClick() {
        self.popViewController(animated: true)
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
