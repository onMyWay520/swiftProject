//
//  PPYNewsTableVC.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/22.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit
private let newsCellID = "PPYNewsTableCellID"

class PPYNewsTableVC: PPYBaseTableViewController {
  fileprivate  var newsVM = PPYNewsViewModel()
  fileprivate  var newsModels:[PPYNewsModel] = [PPYNewsModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="网易新闻"
   mainView.register(UINib(nibName: "PPYNewsTableCell", bundle: nil), forCellReuseIdentifier: newsCellID)
        mainView.rowHeight=HEIGHT(80)
        mainView.sectionFooterHeight=0.001
        mainView.mj_header.beginRefreshing()

    }
   override func loadNewData(){
        newsVM.getNewsHttpData { [unowned self] in
            if self.newsVM.newsModelArray.count > 0 {
                 self.newsModels = self.newsVM.newsModelArray
            }
            self.mainView.mj_header .endRefreshing()
            self.mainView.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsModels.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: newsCellID, for: indexPath) as! PPYNewsTableCell
        cell.newModel = newsModels[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001;
    }
   

}

