//
//  PPYBaseTableViewController.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/25.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

import UIKit
import MJRefresh
class PPYBaseTableViewController: PPYBaseViewController,UITableViewDataSource,UITableViewDelegate {
  
    var mainView  = UITableView ()
    var dataArray = Array<Any> ()
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    let footer = MJRefreshAutoNormalFooter()

    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = CGRect(x: 0, y: STATUS_NAV_BAR_Y , width: KScreenWidth, height: KScreenHeight - STATUS_NAV_BAR_Y)
        mainView = UITableView(frame: rect, style: UITableViewStyle.grouped)
        mainView.delegate = self
        mainView.dataSource = self
        mainView.estimatedRowHeight = 0
        mainView.estimatedSectionFooterHeight = 0
        mainView.estimatedSectionHeaderHeight = 0
        mainView.separatorStyle = .none
        if #available(iOS 11.0, *) {
         mainView.contentInsetAdjustmentBehavior = .never
        };
        header.setRefreshingTarget(self, refreshingAction: #selector(loadNewData))
        footer.setRefreshingTarget(self, refreshingAction:#selector(loadMoreData))
        mainView.mj_header = header
        mainView.mj_footer = footer
        self.view.addSubview(mainView)
        self.mainView.mj_footer?.isHidden=true
    }
    @objc func loadNewData(){
        header.endRefreshing()
        self.mainView.reloadData()
    }
    @objc func loadMoreData(){
        footer.endRefreshing()
        self.mainView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell (
            withIdentifier: "reuseIdentifier", for: indexPath)
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
