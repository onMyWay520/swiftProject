//
//  PPYBaseTableViewController.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/25.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

class PPYBaseTableViewController: PPYBaseViewController,UITableViewDataSource,UITableViewDelegate {
  
    var mainView = UITableView()
    var dataArray = Array<Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = self.view.frame
        mainView=UITableView(frame: rect, style: UITableViewStyle.grouped )
        mainView.delegate=self
        mainView.dataSource=self
        mainView.estimatedRowHeight=0
        mainView.estimatedSectionFooterHeight=0
        mainView.estimatedSectionHeaderHeight=0
        self.view.addSubview(mainView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
