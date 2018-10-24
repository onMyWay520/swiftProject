//
//  PPYMineVC.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/25.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit
import Kingfisher
let HeadViewHeight = ppyScreenH/3.0
class PPYMineVC: PPYBaseTableViewController {
    let datas = ["下","拉","可","以","出","现","很","神","奇","的","事","情"]
    let resueIdentifer = "CustomCell"
    
    private lazy var headView: UIImageView = {
        let headView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: ppyScreenW, height: HeadViewHeight))
        headView.backgroundColor = .white
        headView.contentMode = .scaleAspectFill
        //加载图片
        let url = URL(string: "http://c.hiphotos.baidu.com/zhidao/pic/item/5ab5c9ea15ce36d3c704f35538f33a87e950b156.jpg")
        headView.kf.setImage(with: url)
    
        return headView
    }()
    private lazy var waveView : PPYWaveView={
        let  waveView=PPYWaveView (frame: CGRect(x: 0.0, y: HeadViewHeight+20, width: ppyScreenW, height: 30))
        waveView.backgroundColor=UIColor.orange
        return waveView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        leftButton.isHidden=true
        setupView()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true

    }
    func setupView() {
        view.backgroundColor=UIColor.yellow
        view.addSubview(headView)
        view.addSubview(waveView)
        mainView.tableFooterView = UIView()
        mainView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: resueIdentifer)
        mainView.mj_header.isHidden=true
        mainView.showsVerticalScrollIndicator = false
//        //下面两句必不可少，否则会出现第一次加载时位置不对的情况
        mainView.contentInset.top = HeadViewHeight+50
        mainView.contentOffset = CGPoint(x: 0.0, y: -HeadViewHeight)
    }
    //MARK: - DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: resueIdentifer, for: indexPath)
        cell.textLabel?.text = datas[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    //MARK: - Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsety = scrollView.contentOffset.y + scrollView.contentInset.top
        if offsety <= 0 {
            headView.frame = CGRect(x: 0.0, y: 0.0, width: ppyScreenW, height: HeadViewHeight-offsety)
        }else {
            let height = (HeadViewHeight-offsety) <= 0.0 ? 0.0 : (HeadViewHeight-offsety)
            headView.frame = CGRect(x: 0.0, y: 0.0, width: ppyScreenW, height: height)
            headView.alpha = height/HeadViewHeight
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
