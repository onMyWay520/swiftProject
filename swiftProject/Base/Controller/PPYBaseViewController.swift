//
//  PPYBaseViewController.swift
//  swiftProject
//
//  Created by admin on 2018/9/25.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

import UIKit

class PPYBaseViewController: UIViewController {

    override func viewDidLoad() {
    super.viewDidLoad()
        setNavItem()
//        setUI()
    }
    func setNavItem() {
        self.view.backgroundColor = DefaultColor
        //修改导航栏背景色
        self.navigationController?.navigationBar.barTintColor = DefaultColor
        self.navigationController?.navigationBar.backgroundColor = DefaultColor
        self.navigationController?.navigationBar.tintColor = DefaultColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightButton)
        self.navigationItem
            .leftBarButtonItem =
        UIBarButtonItem.init(customView: leftButton)
        self.navigationController?.navigationBar.isHidden = false

    }
    func setUI() {
        
        
    }
    /// 设置导航栏右边按钮
    lazy var rightButton: UIButton = {
        
        let rightButton = UIButton.init(type: .custom)
        rightButton.setImage(UIImage(named: ""), for: .normal)
        rightButton.sizeToFit()
        rightButton.frame.size = CGSize(width: 30, height: 30)
        rightButton.contentHorizontalAlignment = .right
        rightButton.addTarget(self, action: #selector(rightButtonClick), for: UIControlEvents.touchUpInside)
        return rightButton
    }()
    // MARK: - private method
    lazy var leftButton: UIButton = {
        
        let leftButton = UIButton.init(type: .custom)
        leftButton.setImage(UIImage(named: "backnarrow_white"), for: .normal)
        leftButton.sizeToFit()
        leftButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        leftButton.addTarget(self, action: #selector(leftButtonClick), for: UIControlEvents.touchUpInside)
        return leftButton
    }()
    @objc func rightButtonClick() {
        
    }
    
    @objc func leftButtonClick() {
        
    self.navigationController?.popViewController(animated: false)
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
