//
//  PPYBaseCollectionVC.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/27.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

class PPYBaseCollectionVC: PPYBaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    var mainColltionView : UICollectionView?
    var dataArr : NSMutableArray?//数据源
    var baseLayout :UICollectionViewFlowLayout?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBaseUI()
        setUI()
    }
    func setBaseUI() {
        baseLayout = UICollectionViewFlowLayout()
        mainColltionView=UICollectionView(frame:self.view.frame , collectionViewLayout: baseLayout!)
        mainColltionView?.delegate=self
        mainColltionView?.dataSource=self
        mainColltionView?.backgroundColor=UIColor.white
        self.view.addSubview(mainColltionView!)
        dataArr = NSMutableArray()
    }
    override func setUI() {
       
    }
    //返回多少个组
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    //返回多少个cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    //返回自定义的cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCellId", for: indexPath as IndexPath)
        
        return cell
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
