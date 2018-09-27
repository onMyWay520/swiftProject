//
//  PPYHomeCollectionVC.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/27.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

class PPYHomeCollectionVC: PPYBaseCollectionVC {

    override func viewDidLoad() {
        super.viewDidLoad()
    self.mainColltionView?.register(PPYHomeCollectionCell.self, forCellWithReuseIdentifier: "PPYHomeCollectionCellId")
 // 注册headerView
//        mainColltionView?.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
// 注册footView
//        mainColltionView?.register(CollectionFootView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footIdentifier)
    
        mainColltionView?.frame=CGRect(x: 0, y: 0, width: ppyScreenW, height: ppyScreenH-100)
        baseLayout?.minimumLineSpacing=10
       baseLayout?.minimumInteritemSpacing=10
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1;
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    override  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:PPYHomeCollectionCell  = collectionView.dequeueReusableCell(withReuseIdentifier: "PPYHomeCollectionCellId", for: indexPath) as! PPYHomeCollectionCell
        cell.titleLab?.text="我是标题\(indexPath.row+1)"
        return cell;
    }
    //每个分区的内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(10, 20,10, 20)

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: ppyScreenW/2 - 40, height:200)
        
    }
    //最小 item 间距
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//
//        return 10;
//    }
//    //最小行间距
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
//        return 10;
//    }
    
    
    
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
