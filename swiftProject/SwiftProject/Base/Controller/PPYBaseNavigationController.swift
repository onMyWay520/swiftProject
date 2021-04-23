//
//  PPYBaseNavigationController.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/25.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

import UIKit

class PPYBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
            
    self.interactivePopGestureRecognizer?.delegate = nil

    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count<1 {
        }
        else {
        
      viewController.hidesBottomBarWhenPushed = true     }
      super.pushViewController(viewController, animated: true)
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
