//
//  PPYHomeChildVC.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/26.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

import UIKit
class PPYHomeChildVC: PPYBaseTableViewController {
    //标题数组
    fileprivate var titleArray = Array<Any>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?
            .navigationBar.isHidden = true
        self.mainView.register(PPYHomeGoodsCell.classForCoder(), forCellReuseIdentifier: "goodsCell")
        self.mainView.frame = CGRect(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight - STATUSBAR_HEIGHT)
        titleArray = ["关键字演练","闭包演练","MVVM请求网络","柱状图","详情滑动切换标题","RXSwift介绍","粒子效果"]
        self.mainView.mj_footer?.isHidden = false
        self.mainView.mj_header?.beginRefreshing()
        let  people = PPYPeople ()
        people.eat()//无参数的方法
        people.logMe("log me", logYou: "log you")//有参数的方法

    }

    override func loadNewData() {
        self.dataArray = ["1","2","3","4"]
        self.mainView.mj_header?.endRefreshing()
        self.mainView.reloadData()
        
    }
    override func loadMoreData() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            self.dataArray.append("5")
            self.mainView.reloadData()
            self.mainView.mj_footer?.endRefreshing()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.titleArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5;
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 250 : 0.001;
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "goodsCell"
        var cell:PPYHomeGoodsCell! = tableView.dequeueReusableCell(withIdentifier:cellID) as? PPYHomeGoodsCell
        if cell == nil {
            cell = PPYHomeGoodsCell(style: UITableViewCellStyle.default, reuseIdentifier:cellID)
        }
        cell.titleLab?.text = self.titleArray [indexPath.section] as? String
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let  vi = UIView ()
            let  banner = PPYbannerView.init(frame: CGRect(x: 0, y: 0, width: KScreenWidth, height: 250))
            vi.addSubview(banner)
            return vi
        }
        else{
            return nil
        }
        
        
    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            self.dataArray .remove(at: indexPath.section)
//            self.mainView .reloadData()
//        }
//    }
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
//        return .delete
//    }
//    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//        return "删除"
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc = PPYBaseViewController ()
        switch indexPath.section {
        case 0:
            vc = PPYKeyWordsVC()
            break
        case 1:
           vc = PPYClosureVC()
            break
        case 2:
            vc = PPYNewsTableVC()
            break
        case 3:
            vc = PPYBarVC()
            break
        case 4:
            vc = PPYRXSwiftVC()
            break
//        case 5:
//            let cell = mainView.cellForRow(at: indexPath)
//            let point = CGPoint(x: (cell?.center.x)!, y: (cell?.center.y)!)
//            startEmittering(point)
//            fallthrough
         default:
            break
        }
        navigationController!.pushViewController(vc, animated: false)
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
