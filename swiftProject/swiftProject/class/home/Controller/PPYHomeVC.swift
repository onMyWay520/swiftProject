//
//  PPYHomeVC.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/25.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

class PPYHomeVC: PPYBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.register(PPYHomeGoodsCell.classForCoder(), forCellReuseIdentifier: "goodsCell")
        self.mainView.mj_footer.isHidden=false
        mainView.mj_header.beginRefreshing()
    }
    override func loadNewData() {
        self.dataArray=["1","2","3","4"]
        self.mainView.mj_header.endRefreshing()
        self.mainView .reloadData()

    }
    override func loadMoreData() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            self.dataArray .append("5")
            self.mainView .reloadData()
            self.mainView.mj_footer.endRefreshing()
        }
    }
     func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5;
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001;
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "goodsCell"
        var cell:PPYHomeGoodsCell! = tableView.dequeueReusableCell(withIdentifier:cellID, for: indexPath) as! PPYHomeGoodsCell
        if cell==nil {
           cell=PPYHomeGoodsCell(style: UITableViewCellStyle.default, reuseIdentifier:cellID)
        }
        cell.titleLab?.text="我是标题\(indexPath.section)"
       return cell
    }
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.dataArray .remove(at: indexPath.section)
            self.mainView .reloadData()
        }
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
