//
//  PPYBaseViewController.swift
//  swiftProject
//
//  Created by admin on 2018/9/25.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

class PPYBaseViewController: UIViewController {

    override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor=UIColor.white
    //修改导航栏背景色
    self.navigationController?.navigationBar.barTintColor = defaultColor
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18)]
   self.navigationItem.rightBarButtonItem=setRightButton()
       self.navigationItem.leftBarButtonItem = setBackBarButtonItem()
    }
    /// 设置导航栏右边按钮
    func setRightButton() -> UIBarButtonItem {
        
        let searchItem = UIButton.init(type: .custom)
        searchItem.setImage(UIImage(named: ""), for: .normal)
        searchItem.sizeToFit()
        searchItem.frame.size = CGSize(width: 30, height: 30)
        searchItem.contentHorizontalAlignment = .right
        searchItem.addTarget(self, action: #selector(rightButtonClick), for: UIControlEvents.touchUpInside)
        return UIBarButtonItem.init(customView: searchItem)
    }
    // MARK: - private method
    func setBackBarButtonItem() -> UIBarButtonItem {
        
        let backButton = UIButton.init(type: .custom)
        backButton.setImage(UIImage(named: "backnarrow_white"), for: .normal)
        backButton.sizeToFit()
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        backButton.addTarget(self, action: #selector(backClick), for: UIControlEvents.touchUpInside)
        return UIBarButtonItem.init(customView: backButton)
    }
    @objc func rightButtonClick() {
        
    }
    
    @objc func backClick() {
        
    self.navigationController?.popViewController(animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
