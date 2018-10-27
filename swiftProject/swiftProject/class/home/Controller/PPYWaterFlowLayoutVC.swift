//
//  PPYWaterFlowLayoutVC.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/27.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

class PPYWaterFlowLayoutVC: PPYBaseCollectionVC,PPYWaterFlowLayoutDelegate {
    func waterFlowLayout(layout: PPYWaterFlowLayout, indexPath: NSIndexPath, itemWidth: CGFloat) -> CGFloat {
        let shop : PPYShopModel = self.shops[indexPath.row]
        let heigth = itemWidth * shop.h! / shop.w!;
        return heigth
    }
    fileprivate lazy var shops : [PPYShopModel] = []
    private let shopCellID = "PPYShopCellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        let  path = Bundle.main.path(forResource: "shop", ofType: "plist")
        let arr = NSArray(contentsOfFile: path!)
        for dic in arr! {
            let shop = PPYShopModel()
            let dict = dic as! NSDictionary
            shop.h = dict["h"] as? CGFloat
            shop.w = dict["w"] as? CGFloat
            shop.img = dict["img"] as? String
            shop.price = dict["price"] as? String
            shops.append(shop)
        }
        let layout  = PPYWaterFlowLayout()
        layout.delegate = self
        mainColltionView?.collectionViewLayout=layout
        self.mainColltionView?.register(PPYShopCell.self, forCellWithReuseIdentifier: shopCellID)
    }
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1;
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.shops.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : PPYShopCell = collectionView.dequeueReusableCell(withReuseIdentifier: shopCellID, for: indexPath) as! PPYShopCell
        let shop : PPYShopModel = self.shops[indexPath.row]
        cell.shop = shop
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoView = PPYPhotoPreviewer()
        let cell : PPYShopCell  = mainColltionView?.cellForItem(at: indexPath)  as! PPYShopCell
        let window = UIApplication.shared.keyWindow
        
        photoView.preview(fromImageView:cell.goodsImageView! , container: window!)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
