//
//  PPYConfirmOrderVC.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/13.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

import UIKit

class PPYConfirmOrderVC: PPYBaseTableViewController {
    // MARK: - 属性
   // MARK:  已经添加进购物车的商品模型数组，初始化
    var addGoodArray: [PPYGoodsModel]! {
        //属性监视
        didSet {
            
        }
    }
    //购买商品的总金额
    var price: Float = 0.00
    
   // MARK: 商品列表cell的重用标示符
    fileprivate let shoppingCarCellIdntifier  = "shoppingCarCellIdntifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="购物车"
        mainView.rowHeight = 80
        //注册cell
        mainView.register(PPYShopingCell.self, forCellReuseIdentifier: shoppingCarCellIdntifier)
        //添加子控件
        view.addSubview(mainView)
        view.addSubview(bottomView)
        bottomView.addSubview(selectButton)
        bottomView.addSubview(totalPriceLabel)
        bottomView.addSubview(buyButton)
        let addGoods = PPYDataBaseManager.shared.loadGoods()
        if ((addGoods?.count) != nil){
            addGoodArray = addGoods!
        }
        layoutUI()
        judgeIsSelectAll()
        reCalculateGoodCount()

    }
    // MARK: 判断是否需要全选中
    func judgeIsSelectAll(){
        if (addGoodArray == nil) {
            return
        }
        for model in addGoodArray! {
            if model.selected != true {
                //只要有一个不等于就不全选中
                selectButton.isSelected = false
                break
            }
            else{
                selectButton.isSelected = true
            }
        }
    }
    override func leftButtonClick(){
    NotificationCenter.default.post(name: NSNotification.Name("addGoodArray"), object: self, userInfo: ["addGoodArray":addGoodArray])
 self.navigationController?.popViewController(animated: true)
    }
    // MARK: 底部视图
    lazy var bottomView : UIView = {
        let bottomView = UIView()
        bottomView.backgroundColor  = UIColor.white
        return bottomView
    }()
    
    // MARK: 底部多选、反选的按钮
    lazy var selectButton: UIButton = {
        let selectButton = UIButton(type: UIButtonType.custom)
        selectButton.setImage(UIImage(named: "check_n"), for: UIControlState())
        selectButton.setImage(UIImage(named: "check_p"), for: UIControlState.selected)
        selectButton.setTitle("多选\\反选", for: UIControlState())
        selectButton.setTitleColor(UIColor.gray, for: UIControlState())
        selectButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        selectButton.addTarget(self, action:#selector(didSelectButton), for: UIControlEvents.touchUpInside)
        //默认是已经选择的状态
        selectButton.isSelected = true
        selectButton.sizeToFit()

        return selectButton
    }()
    
    // MARK: 底部总价格的Label
    lazy var totalPriceLabel: UILabel = {
        let label = UILabel()
        let attributeText = NSMutableAttributedString(string: "总价格\(self.price)0")
        attributeText.setAttributes([NSAttributedStringKey.foregroundColor:UIColor.red], range: NSMakeRange(5, attributeText.length - 5))
        
        label.attributedText = attributeText
        label.sizeToFit()
    
        return label
    }()
    
    // MARK: 点击付款的按钮
    lazy var buyButton : UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setTitle("付款", for: UIControlState())
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = DefaultColor
        //裁剪
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        
        return button
    }()
    func layoutUI() {
        
        //约束子控件
        mainView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(0)
            make.bottom.equalTo(-TABBAR_HEIGHT)
        }
        //底部选择条
        bottomView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(0)
            make.height.equalTo(TABBAR_HEIGHT)
        }
        
        selectButton.snp.makeConstraints { (make) in
         make.left.equalTo(16)
         make.centerY.equalTo(bottomView.snp.centerY)
        }
        
        totalPriceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(selectButton.snp.right).offset(10)
            make.center.equalTo(bottomView.snp.center)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        
        buyButton.snp.makeConstraints { (make) in
            make.left.equalTo(totalPriceLabel.snp.right).offset(10)
            make.top.equalTo(totalPriceLabel.snp.top)
            make.width.equalTo(88)
            make.height.equalTo(40)
        }
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //如果没有数据就为0行
        return addGoodArray!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: shoppingCarCellIdntifier, for: indexPath) as! PPYShopingCell
        /*
         属性赋值时，我们发现需要需要再自定义一个tableViewCell来接收模型的数据
         cell.goodModel = addGoodArray![indexPath.row]
         */
        cell.addGoodArray = addGoodArray![indexPath.row]
        
        cell.delegate = self
        
        return cell
    }
    // MARK:删除按钮事件
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {

            PPYDataBaseManager.shared.deleteshopCart(mode:addGoodArray[indexPath.row] )
                addGoodArray .remove(at: indexPath.row)
                reCalculateGoodCount()

                self.mainView .reloadData()
            }
        }
        func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
            return .delete
        }
        func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
            return "删除"
        }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }


}
// MARK: cell点击的代理方法
extension PPYConfirmOrderVC : PPYShoppingCellDelegate {
    
    //商品数量按钮的点击
    func shopping(_ shopping: PPYShopingCell, button: UIButton, label: UILabel) {
        
        //获得点击当前的cell
        guard let indexPath = mainView.indexPath(for: shopping)
            else {
            return
        }
        
        //获得当前数据模型
        let data = addGoodArray![indexPath.row]
        
        if button.tag == 10 {//减
            
            if data.count < 1 {
                //count 的数量不能为0
                return
            }
            
            data.count -= 1
            label.text = "\(data.count)"
            
        }
        else{//加
            data.count += 1
            label.text = "\(data.count)"
        }
        PPYDataBaseManager.shared.updateshopCart(model: data)
        //重新计算总价格
        reCalculateGoodCount()
    }
   // MARK: 选择按钮的点击代理
    func shoppingCalculate() {
        reCalculateGoodCount()
        judgeIsSelectAll()

    }
}
extension PPYConfirmOrderVC {
    
 // MARK: 重新计算商品的数量
    fileprivate func reCalculateGoodCount() {
        //遍历模型
        for model in addGoodArray! {
            //计算选中的商品
            if model.selected == true {
                price += Float(model.count) * (model.newPrice! as NSString).floatValue
            }
            
        }
        
        //赋值价格
        let  attributeText = NSMutableAttributedString(string: "总共价格: \(self.price)0")
        
        attributeText.setAttributes([NSAttributedStringKey.foregroundColor:UIColor.red], range: NSMakeRange(5, attributeText.length - 5))
        totalPriceLabel.attributedText = attributeText
        
        //清空price
        price = 0
        
        mainView.reloadData()
    }
    
 // MARK: 全选商品按钮的点击
    @objc fileprivate func didSelectButton(_ btn:UIButton) {
        
        
        btn.isSelected = !btn.isSelected
        
        for model in addGoodArray! {
            model.selected = btn.isSelected
        }
        
        //重新计算价格
        reCalculateGoodCount()
        
        mainView.reloadData()
    }
}
