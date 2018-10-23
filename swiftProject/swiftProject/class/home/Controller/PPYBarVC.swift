//
//  PPYBarVC.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/23.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

class PPYBarVC: PPYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="柱状图动画"

    }
    override func setUI() {
        guard let jsonPath:String = Bundle.main.path(forResource: "zhuzhuang.json", ofType: nil) else {return}
        //2.获取json文件的数据
        guard let jsonData = NSData(contentsOfFile: jsonPath) else {return}
        //3.将json文件的数据转化为swift可读数据
        guard let anyObject = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers) else {return}
        guard let dataDic = anyObject as? [String:Any] else {return}
    
        guard let resultData = dataDic["resultData"] as? [String:Any] else {return}
        
        guard let dataArray = resultData["progressList"] as? [[String : String]] else { return }
        DeLog("dataArray"+" --- \(dataArray.count)")
        var barModelArr : [PPYBarModel] = []
        for dict in dataArray {
            let model = PPYBarModel(dic: dict)
            barModelArr.append(model)
        }
        
        DeLog("个数"+" --- \(barModelArr.count)")
        
        var chartView : PPYChartView = PPYChartView()
        chartView = PPYChartView(frame: CGRect(x: 0, y: 200, width: ppyScreenW, height: 410))
        chartView.loadData(YMaxValue: 1000, XValues: barModelArr, totalMoneyColor: UIColor.purple, title: "观影频次", bottomName: "各种卡")
        chartView.backgroundColor = UIColor.white
        view.addSubview(chartView)
        
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
