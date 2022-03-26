//
//  PPYClosureVC.swift
//  swiftProject
//
//  Created by admin on 2018/10/21.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

import UIKit

//声明一个闭包类型 AddBlock
typealias AddBlock = (Int,Int)->(Int);

class PPYClosureVC: PPYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "闭包演练"
    }

    @IBAction func closureBtnClick1(_ sender: Any) {
        //闭包是无名的，因为他们能够从上下文中捕获变量、常量，从而应用在自身的作用区域。
        let a = {
            print("这也是闭包")
        }
        a()

    }
    
    @IBAction func closureBtnClick2(_ sender: Any) {
        //用变量记录函数 (带参数的闭包)
        //带有参数的闭包
        //参数返回值 实现代码  {形参->返回值 in 代码}
        //带参数待返回值的闭包
        var countNum = {(num1:Int,num2:Int)->Int in
            return num1 + num2
        }
        //第一次简化 类型自动推导 可以根据参数推断
//         countNum = {
//            (a, b) in
//            return a * b
//        }
        //第二次简化 如果函数体只包含一句 return 代码，可省略 return
//        countNum = {
//            (a, b) in
//            a * b
//        }
        /*
         第三次简化
         被捕获的参数列表中，含有a、b，下标从0开始，可通过"$"获取。
         编译器亦可通过，捕获列表自行推断出参数。
         故可省略参数列表 （a, b）和 关键字 in
         */
        countNum = {
            $0 * $1
        }
        let count1 = countNum(2,3)
        print(count1)
    
    }
    
    @IBAction func closureBtnClick3(_ sender: Any) {
        /*
         数组提供了一个排序函数，sorted().使用的是默认规则，当然我们也可以定制排序规则。
         */
        
        let names = ["ZZZZZZ", "BB", "A", "CCCC", "EEEEE"]
        print( names.sorted())
        // ["A", "BB", "CCCC", "EEEEE", "ZZZZZZ"]
        
        //更改排序规则 其实就是利用了函数重载，具体可看函数定义
        //sorted(by: <#T##(String, String) throws -> Bool#>)
        
//        names.sorted() {
//            $0.count > $1.count
//        }

        // ["ZZZZZZ", "EEEEE", "CCCC", "BB", "A"]
    
    }
    
    @IBAction func closureBtnClick4(_ sender: Any) {
        /*
         循环遍历集合中的元素，相当于for-in 快速遍历
         */
        let values = [5, 3, 2, 3,1]
        values.forEach {
            print("element is \($0)")
        }
    }
    
    @IBAction func closureBtnClick5(_ sender: Any) {
        /*
         函数原型:
         func filter(_ isIncluded: (Element) -> Bool) -> [Element]
         
         按照规则过滤原数组
         */
        let values = [1.5, 10, 4.6, 3.2, 8.1]
        let res = values.filter {
            return $0 > 4
        }
        print(res)//[10.0, 4.5999999999999996, 8.0999999999999996]
        //res是移除掉小于或等于4的元素的新数组
    
    }
    
    @IBAction func closureBtnClick6(_ sender: Any) {
        /*
         函数原型：
         students.map(<#T##transform: (String) throws -> T##(String) throws -> T#>)
         数组映射
         */
        let input = ["0", "12", "name", "hi", "3"]
        let number = input.map {
            Int($0) //将元素转换为Int型
        }
        print(number)
        //注意类型转换可能失败，所以返回的是可选型
        //[Optional(0), Optional(12), nil, nil, Optional(3)]
        /*
         另外一个高度近似的函数
         compactMap
         隐含了两种操作
         1.解包
         2.展开并合并
         */
        
        let compactNumber = input.compactMap() {
            Int($0)
        }
        print(compactNumber)
        //[0, 12, 3]
    
    }
    @IBAction func closureBtnClick7(_ sender: Any) {
        /*
         函数原型
         reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, String) throws -> Result##(Result, String) throws -> Result#>)
         */
        //数组
        let flatNumber = [5, 12, 3]
        let sum = flatNumber.reduce(0) {
            return $0 + $1
        }
        print(sum)
        //20
        //字典
        let stock = [1.5: 5, 10: 2, 4.99: 20, 2.30: 5, 8.19: 30]
        let stockSum = stock.reduce(0) {
            return $0 + $1.key * Double($1.value)
        }
        print(stockSum)
        //384.5
        
        /*
         另一个reduce重载函数
         注意inout 关键字，所以想想你可以怎么应用？
         */
//        input.reduce(into: <#T##Result#>) { (<#inout Result#>, <#String#>) in
//            <#code#>
//        }
    }
    @IBAction func closureBtnClick8(_ sender: Any){
        
        let  add:AddBlock = {
            $0 * $1
        }
        let count = add(2,3)
        print(count)
    }
    @IBAction func closureBtnClick9(_ sender: Any){
        UIAlertController.alert(title: "温馨提示", message: "自定义alertView") {
            print("确定点击事件")
        }
      
    }
    @IBAction func closureBtnClick10(_ sender: Any){
        
        UIAlertController.alertSheet(title: "温馨提示", message: "自定义底部框", buttons:  ["点击1","点击2","点击3"], dismiss: { (btnIndex) in
            print("\(btnIndex)")
        }) {
            print("cancelClicked")
        }
    }
    @IBAction func closureBtnClick11(_ sender: Any){
        UIAlertController.alert(title: "温馨提示", message: "自定义弹框", cancelButtonTitle: "取消", otherButtons:  ["点击1","点击2","点击3"], dismiss: { (btnIndex) in
            print("\(btnIndex)")
        }) {
             print("cancelClicked")
        }
    }
    @IBAction func closureBtnClick12(_ sender: Any){
        
        
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
