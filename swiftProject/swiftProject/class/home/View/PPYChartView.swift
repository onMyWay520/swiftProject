//
//  PPYChartView.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/23.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit
import SnapKit
class PPYChartView: PPYBaseView {

    private let kXDistanceValue:CGFloat = 50.0
    private let kYDistanceValue:CGFloat = 55.0
    private let kTopDistanceValue:CGFloat = 30.0
    private let kXWidthValue:CGFloat = 10.0
    //Y轴的最大值
    var YMaxValue:NSInteger?
    //y轴的值
    var YValues:NSArray?
    //颜色
    var totalMoneyColor:UIColor?
    //各个卡所对应的值 x轴的值
    var XValues :[PPYBarModel] = [PPYBarModel]()
    
    var backSc :UIScrollView = UIScrollView()
    var topTitle : String = ""
    var bottomName : String = ""
    
    internal func loadData(YMaxValue:NSInteger,
                        XValues:[PPYBarModel] ,
                        totalMoneyColor:UIColor,
                        title : String,
                        bottomName : String){
        self.YMaxValue = YMaxValue;
        self.totalMoneyColor = totalMoneyColor;
        DeLog("XValues"+" --- \(String(describing: XValues))")
        self.XValues = XValues;
        self.bottomName = bottomName
        self.topTitle = title
        self.createTitle()
        self.createYView()
        self.createXView()
        
        
    }
    // MARK: - 标题
    private func createTitle(){
        let lineView = UIView(frame: CGRect(x: 9, y: 9, width: 4, height: 14))
        lineView.backgroundColor = UIColor.lightGray
        self.addSubview(lineView)
        
        let nameLabel : UILabel = UILabel()
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(lineView.snp.right).offset(5)
            make.centerY.equalTo(lineView.snp.centerY)
            make.width.equalTo(ppyScreenW - 10)
            make.height.equalTo(18)
            
        })
        nameLabel.textColor = UIColor.lightGray
        nameLabel.text = self.topTitle
        nameLabel.font = UIFont.systemFont(ofSize: 13)
        nameLabel.textAlignment = .left
        
        
        let midView : UIView = UIView()
        self.addSubview(midView)
        midView.backgroundColor = UIColor.lightGray
        midView.snp.makeConstraints({ (make) in
            make.top.equalTo(lineView.snp.bottom).offset(9)
            make.width.equalTo(ppyScreenW)
            make.height.equalTo(1)
            
        })
        
    }
    
    // MARK: - Y坐标
    private func createYView(){
        for index in 0 ..< 5 {
            let lineView = UIView(frame: CGRect(x: kXDistanceValue, y: CGFloat(index)*(kYDistanceValue+1.0)+kYDistanceValue+kTopDistanceValue, width: self.frame.size.width-kXDistanceValue, height: 1))
            
            // Y坐标上的值
            let yValueLabel =  PPYUtil.createLabel(text: String(self.YMaxValue!-self.YMaxValue!/5*index), textColor: UIColor.lightGray, font: UIFont.systemFont(ofSize: 10))
            yValueLabel.frame=CGRect(x: 30, y: lineView.frame.midY-10-15, width: 25, height: 20)
            self.addSubview(yValueLabel)
            
        }
    }
    
    // MARK: - X坐标
    private func createXView(){
        var xValue:CGFloat = CGFloat()
        if CGFloat((self.XValues.count))*(100+kXWidthValue*2)>self.frame.size.width {
            xValue = CGFloat((self.XValues.count))*(100+kXWidthValue*2)
            print("xValue1"+" --- \(String(describing: xValue))")
        }else{
            xValue = self.frame.size.width
            print("xValue2"+" --- \(String(describing: xValue))")
        }
        
        self.backSc = UIScrollView(frame: CGRect(x: kXDistanceValue + 5, y: 40, width: self.frame.size.width-kXDistanceValue - 5, height: (kYDistanceValue)*5+25+kTopDistanceValue + 15))
        self.backSc.showsVerticalScrollIndicator = false
        self.backSc.showsHorizontalScrollIndicator = false
        //self.backSc.contentSize = CGSize(width: xValue, height:  20)
        //self.backSc.backgroundColor = UIColor.green
        //self.backSc.contentSize = CGSize(width: self.frame.size.width-kXDistanceValue, height:  20)
        self.backSc.bounces = true
        self.addSubview((self.backSc))
        
        //左侧的y交易额元
        let leftView = UIView()
        //leftView.backgroundColor = UIColor.lightGray
        self.addSubview((leftView))
        leftView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(5)
            make.top.equalTo(self.backSc)
            make.width.equalTo(25)
            make.height.equalTo(self.backSc.height)
            
        })
        let leftLabel = UILabel()
        leftLabel.textColor = UIColor.lightGray
        leftLabel.text = "y交易额元"
        leftLabel.textAlignment = .center
        leftLabel.font = UIFont.systemFont(ofSize: 14)
        leftLabel.numberOfLines = 0
        self.addSubview((leftLabel))
    
        leftLabel.snp.makeConstraints({ (make) in
                make.width.equalTo(21)
                make.height.equalTo(self.backSc.height)
                make.center.equalTo(leftView)
                
        })

    
        //右侧的X会员卡名字
        let rightView = UIView()
        self.addSubview((rightView))
        rightView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.backSc)
            make.top.equalTo(self.backSc.snp.bottom).offset(-2)
            make.width.equalTo(self.backSc.width)
            make.height.equalTo(25)
            
        })
        let rightLabel = UILabel()
        rightLabel.textColor = UIColor.lightGray
        rightLabel.text = "x会员卡名字"
        rightLabel.textAlignment = .center
        rightLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview((rightLabel))
        rightLabel.snp.makeConstraints({ (make) in
            make.width.equalTo(self.backSc.width)
            make.height.equalTo(23)
            make.center.equalTo(rightView)
            
        })
        
        
        //白色背景
        let backView = UIView(frame: CGRect(x: 0, y: kTopDistanceValue, width: xValue, height: (kYDistanceValue)*5+25))
        backView.backgroundColor = UIColor.white
        self.backSc.addSubview(backView)
        
        //横向的5条线
        for index in 0..<5 {
            let lineView = UIView(frame: CGRect(x: 0, y: CGFloat(index)*(kYDistanceValue+1.0)+kTopDistanceValue, width:self.backSc.width - 5, height: 3))
            lineView.backgroundColor = UIColor.lightGray
            self.backSc.addSubview(lineView)
        }
        
        //X轴
        let XView = UIView(frame: CGRect(x: 0, y: (kYDistanceValue+1)*5+kTopDistanceValue, width: self.backSc.width - 5, height: 3))
        XView.backgroundColor = UIColor.groupTableViewBackground
        self.backSc.addSubview(XView)
        
        
        
        //x轴的坐标:卡名和卡柱状图
        
        let avegValue = CGFloat((CGFloat(self.backSc.width) - CGFloat(self.XValues.count)) / CGFloat(self.XValues.count))
        DeLog("平均"+" --- \(avegValue)")
        for i in 0..<self.XValues.count {
            
            let xlabel : UILabel = UILabel(frame: CGRect(x: CGFloat(i)*avegValue, y: (kYDistanceValue+1)*5+kTopDistanceValue, width: avegValue, height: 35))
            let model : PPYBarModel = self.XValues[i]
            xlabel.text = model.cardName
            xlabel.textAlignment = .center
            xlabel.textColor = UIColor.lightGray
            xlabel.font = UIFont.systemFont(ofSize: 13)
            self.backSc.addSubview(xlabel)
            //卡柱状图
            let totalHeight = CGFloat((model.totalMoney as NSString).floatValue)/(CGFloat(self.YMaxValue!))*5*(kYDistanceValue+1)
            
            
            let xTotalValue: UIView = UIView(frame: CGRect(x: xlabel.frame.midX-kXWidthValue, y: xlabel.frame.origin.y, width: kXWidthValue * 2 + 3, height: 1))
            
            xTotalValue.layer.cornerRadius = (kXWidthValue * 2 + 3) / 2
            xTotalValue.layer.masksToBounds = true;
            
            
            self.backSc.addSubview(xTotalValue)
            
            
            
            //卡金额柱状图
            let totalValueLabel : UILabel = UILabel.init(frame: CGRect.init(x: xTotalValue.frame.origin.x-6, y: xlabel.frame.origin.y-totalHeight-18-13, width: 100, height: 15))
            
            totalValueLabel.text = model.totalMoney
            totalValueLabel.font = UIFont.systemFont(ofSize: 10)
            totalValueLabel.textColor = UIColor.lightGray
            self.backSc.addSubview(totalValueLabel)
            
            
            UIView.animate(withDuration: 1.0, animations: {
                xTotalValue.y = xlabel.frame.origin.y-totalHeight
                xTotalValue.height = totalHeight
                
                //获取渐变层
                let gradientLayer = CAGradientLayer().rainbowLayer()
                gradientLayer.frame = xTotalValue.bounds
                xTotalValue.layer.insertSublayer(gradientLayer, at: 0)
                
                
                let transform : CGAffineTransform = CGAffineTransform.init(rotationAngle:CGFloat(-Double.pi/4/2.0))
                totalValueLabel.transform = transform
            }, completion: { (finish) in
                
            })
        }
        
    }
}
