//
//  PPYShopCartVC.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/25.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

class PPYShopCartVC: PPYBaseTableViewController,CAAnimationDelegate {
    ///贝塞尔曲线
    fileprivate var path : UIBezierPath?
    //自定义图层
    var layer: CALayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.register(PPYAddCartCell.classForCoder(), forCellReuseIdentifier: "goodsCell")
        self.mainView.mj_footer.isHidden=false
        mainView.mj_header.beginRefreshing()
       
        
    }
    
    override func loadNewData() {
        self.dataArray=["1","2","3","4"]
        self.mainView.mj_header.endRefreshing()
        self.mainView .reloadData()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArray.count
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
        let cellID = "goodsCell"
        var cell:PPYAddCartCell! = tableView.dequeueReusableCell(withIdentifier:cellID, for: indexPath) as? PPYAddCartCell
        if cell==nil {
            cell=PPYAddCartCell(style: UITableViewCellStyle.default, reuseIdentifier:cellID)
        }
        cell.delegate=self as PPYAddCartCellDelegate
        cell.titleLab?.text="我是标题\(indexPath.section+1)"
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
// MARK: - Cell点击的代理方法
extension PPYShopCartVC : PPYAddCartCellDelegate {
    
    func clickTransmitData(_ cell: PPYAddCartCell, icon: UIImageView) {
        
        guard let indexPath = self.mainView.indexPath(for: cell) else {
            //没有创建数据就直接返回
            return
        }
        //获得当前的数据
        //            let redata = goodArray[indexPath.row]
        //
        //            //添加到已购买数组之中
        //            addGoodArray.append(redata)
        
        //重新计算iconView的frame值
        //获取当前行的frame值
        var rect = self.mainView.rectForRow(at: indexPath)
        
        rect.origin.y -= mainView.contentOffset.y
        var headRect = icon.frame
        headRect.origin.y = rect.origin.y + headRect.origin.y - 64
        startAnimation(headRect, iconView: icon)
    }
}
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
            path?.addQuadCurve(to: CGPoint(x: ppyScreenW * 0.8-30, y: ppyScreenH-49), controlPoint: CGPoint(x: ppyScreenW * 0.5, y: 100))

            
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
