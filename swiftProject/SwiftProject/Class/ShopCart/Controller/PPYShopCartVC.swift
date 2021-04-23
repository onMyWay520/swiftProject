//
//  PPYShopCartVC.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/25.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

import UIKit

class PPYShopCartVC: PPYBaseTableViewController,CAAnimationDelegate {
    ///贝塞尔曲线
    fileprivate var path : UIBezierPath?
    ///商品列表cell的重用标识
    fileprivate let addCartCellID = "PPYAddCartCellID"
    //商品模型数组
    fileprivate var goodArray = Array<Any>()
    //自定义图层
    var layer: CALayer?
    /// 已经添加到购物车的商品模型数组
    fileprivate var addGoodArray = [PPYGoodsModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setmyUI()
        
    }
   func setmyUI(){
   self.mainView.register(PPYAddCartCell.classForCoder(), forCellReuseIdentifier: addCartCellID)
    self.mainView.mj_footer.isHidden=false
   
    //初始化模型数组,制作一些假数据
    for i in 0..<6 {
    var dict = [String :AnyObject]()
    dict["iconName"] = "goods_0\(i+1)" as AnyObject
    dict["title"] = "水果\(i+1)" as AnyObject
    dict["desc"] = "这是第\(i)个商品" as AnyObject
    dict["newPrice"] = "20\(i)" as AnyObject
    dict["oldPrice"] = "30\(i)" as AnyObject
    dict["goodsId"] = "10\(i)" as AnyObject

    let model = PPYGoodsModel.deserialize(from: dict)
    //将字典转模型并添加到数组中
    goodArray.append( model as Any )
    }
    mainView.addSubview(confirmButton)
    confirmButton.frame=CGRect(x: 0, y: KScreenHeight - TABBAR_HEIGHT - 50 - STATUS_NAV_BAR_Y, width: KScreenWidth, height: 50)
    let addGoods = PPYDataBaseManager.shared.loadGoods()
    if ((addGoods?.count) != nil){
     addGoodArray = addGoods!
      var sum = 0
      for model in addGoodArray {
        sum = sum + model.count
        
        self.tabBarItem.badgeValue = "\(sum)"
      }
    }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(addGoodArr), name: NSNotification.Name(rawValue:"addGoodArray"), object: nil)
        leftButton.isHidden=true
    }
   // 实现通知监听方法
    @objc func addGoodArr(nofi : Notification){
        let addGoodArr = nofi.userInfo!["addGoodArray"] as! [PPYGoodsModel]
        var sum = 0
        for model in addGoodArr{
          sum = sum + model.count
            
          self.tabBarItem.badgeValue = "\(sum)"
        }
    
    }
   // 最后要记得移除通知
    deinit {
    /// 移除通知
    NotificationCenter.default.removeObserver(self)
    }
    
    fileprivate lazy var confirmButton: UIButton = {
        let confirmButton  = UIButton.buttonWith(titleColor: UIColor.white, titleFont: UIFont.systemFont(ofSize: 16), backgroundColor: DefaultColor, title: "确定订单", cornerRadius: 0)
        confirmButton .addTarget(self, action: #selector(confirmButtonClick), for: UIControlEvents.touchUpInside)
        return confirmButton
    }()
    override func loadNewData() {
       

        self.mainView.mj_header.endRefreshing()
        self.mainView.reloadData()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.goodArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
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
        var cell:PPYAddCartCell! = tableView.dequeueReusableCell(withIdentifier:addCartCellID, for: indexPath) as? PPYAddCartCell
        if cell==nil {
            cell = PPYAddCartCell(style: UITableViewCellStyle.default, reuseIdentifier:addCartCellID)
        }
        cell.delegate=self as PPYAddCartCellDelegate
        cell.goodModel = goodArray[indexPath.section] as? PPYGoodsModel
        
        return cell
    }
    @objc func confirmButtonClick() {
        let vc = PPYConfirmOrderVC()
     self.navigationController?.pushViewController(vc, animated: false)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
// MARK: - Cell点击的代理方法
extension PPYShopCartVC : PPYAddCartCellDelegate {
    
    func clickTransmitData(_ cell: PPYAddCartCell, icon: UIImageView) {
        
        guard let indexPath = self.mainView.indexPath(for: cell) else {
            //没有创建数据就直接返回
            return
        }
        //获得当前的数据
        let redata = goodArray[indexPath.section] as! PPYGoodsModel
        //首先获取之前保存的
        let addGoods = PPYDataBaseManager.shared.selectShopCartgoods(goodsId: redata.goodsId)
        if addGoods.count == 0 {//判断购物车之前没有保存数据
            redata.alreadyAddShoppingCart=true
            //添加到已加入购物车数组之中
            addGoodArray.append(redata)
            //加入到数据库中
            PPYDataBaseManager.shared.insertshopCartData(model: redata )
            if (addGoodArray.count > 0){
                var sum = 0
                for model in addGoodArray {
                    sum = sum + model.count
                    
                    self.tabBarItem.badgeValue = "\(sum)"
                }
            }
        }
        else{//判断购物车之前保存有数据
            let model = addGoods[0]
                if(model.alreadyAddShoppingCart){//之前加入过购物车
                    model.count += 1
                    PPYDataBaseManager.shared.updateshopCart(model: model )

                }
                else{//之前没有加入过购物车
                    redata.alreadyAddShoppingCart=true
                    //添加到已加入购物车数组之中
                    addGoodArray.append(redata)
                    //加入到数据库中
                    PPYDataBaseManager.shared.insertshopCartData(model: redata )
                }
            let addGoodsArray = PPYDataBaseManager.shared.loadGoods()

            if ((addGoodsArray?.count)! > 0){
                var sum = 0
                for model in addGoodsArray! {
                    sum = sum + model.count

                    self.tabBarItem.badgeValue = "\(sum)"
                }
            }
           
        }

       
        //重新计算iconView的frame值
        //获取当前行的frame值
        var rect = self.mainView.rectForRow(at: indexPath)
        
        rect.origin.y -= mainView.contentOffset.y
        var headRect = icon.frame
        headRect.origin.y = rect.origin.y + headRect.origin.y - 64
        startAnimation(headRect, iconView: icon)
    }
}
// MARK:加入购物车动画相关
extension PPYShopCartVC {
    fileprivate func startAnimation(_ rect: CGRect ,iconView:UIImageView){
        if layer == nil {
            //创建核心动画
            layer = CALayer()
            layer?.contents = iconView.layer.contents
            layer?.contentsGravity = kCAGravityResizeAspectFill
            layer?.bounds = rect
            layer?.cornerRadius = layer!.bounds.height * 0.5
            layer?.masksToBounds = true
            layer?.position = CGPoint(x: iconView.center.x, y: rect.maxY)
            UIApplication.shared.keyWindow?.layer.addSublayer(layer!)
            path = UIBezierPath()
            path?.move(to: layer!.position)
            path?.addQuadCurve(to: CGPoint(x: KScreenWidth * 0.8-30, y: KScreenHeight-49), controlPoint: CGPoint(x: KScreenWidth * 0.5, y: 100))

            
        }
        //组动画
        groupAnimation()
    }
    //组动画,帧动画抛入购物车，并且放大，缩小图层增加懂效果
    fileprivate func groupAnimation() {
        
        // 开始动画禁用tableview交互
        self.mainView.isUserInteractionEnabled = false
        
        // 帧动画
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = path!.cgPath
        animation.rotationMode = kCAAnimationRotateAuto
        
        // 放大动画
        let bigAnimation = CABasicAnimation(keyPath: "transform.scale")
        bigAnimation.duration = 0.5
        bigAnimation.fromValue = 1
        bigAnimation.toValue = 2
        bigAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        
        // 缩小动画
        let smallAnimation = CABasicAnimation(keyPath: "transform.scale")
        smallAnimation.beginTime = 0.5
        smallAnimation.duration = 1.5
        smallAnimation.fromValue = 2
        smallAnimation.toValue = 0.3
        smallAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        // 组动画
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [animation, bigAnimation, smallAnimation]
        groupAnimation.duration = 2
        groupAnimation.isRemovedOnCompletion = false
        groupAnimation.fillMode = kCAFillModeForwards
        groupAnimation.delegate = self as CAAnimationDelegate ;
        layer?.add(groupAnimation, forKey: "groupAnimation")
        
    }
    /**
     动画结束后做一些操作
     */
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
        
        // 如果动画是我们的组动画，才开始一些操作
        if anim == layer?.animation(forKey: "groupAnimation") {
            
            // 开启交互
            mainView.isUserInteractionEnabled = true
            
            // 隐藏图层
            layer?.removeAllAnimations()
            layer?.removeFromSuperlayer()
            layer = nil
            
        
        }
    }

}
