//
//  PPYHomeVC.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/25.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit
private let ppyTitleViewH :CGFloat = 40
class PPYHomeVC: UIViewController {
    let titles = ["热卖","推荐","果汁","牛奶","方便面","矿泉水","功能饮料","其他"]
    fileprivate lazy var pageTitleView : PPYPageTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y: ppyStatusBarH + ppyNavigationBarH, width: ppyScreenW, height: ppyTitleViewH)
 let titleView = PPYPageTitleView(frame: titleFrame, titles: (self?.titles)!)        // MARK:- 控制器作为EntertainmentTitleView代理
        titleView.delegate = self
        return titleView
        }()
    
    fileprivate lazy var pageContentView : PPYPageContentView = { [weak self] in
        let contentFrame = CGRect(x: 0, y: ppyStatusBarH + ppyNavigationBarH + ppyTitleViewH+0.5, width: ppyScreenW, height: ppyScreenH - ppyStatusBarH - ppyNavigationBarH - ppyTitleViewH - ppyTabBarH)
        
        var childVcs = [UIViewController]()
        for _ in 0...titles.count {
            childVcs.append(PPYHomeChildVC())

        }
        let contentView = PPYPageContentView(frame: contentFrame, childVcs: childVcs, parentVc: self)
        //MARK:- 控制器作为PageContentViewDelegate代理
        contentView.delegate = self
        return contentView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
}
    // MARK:- setupUI
    extension PPYHomeVC {
        fileprivate func setupUI() {
            //不需要调整scrollview的内边距
//           automaticallyAdjustsScrollViewInsets = false
            self.view.addSubview(pageTitleView)
            self.view.addSubview(pageContentView)
        }
    }

    //MARK:- PageTitleViewDelegate代理实现
    extension PPYHomeVC : PageTitleViewDelegate {
        func pageTitleView(_ titleView: PPYPageTitleView, selectedIndex index: Int) {
            pageContentView.setCurrentIndex(currentIndex: index)
        }
    }

    //MARK:-ContentViewDelegate代理实现
    extension PPYHomeVC : PageContentViewDelegate{
        func pageContentView(_ contentView: PPYPageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
            pageTitleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
        }
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
