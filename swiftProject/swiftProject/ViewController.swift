//
//  ViewController.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/25.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit
enum Student {
    case Name(String)
    case Mark(Int,Int,Int)
}
enum Month: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var animals = ["cat", "dog", "weasel"]
//        print(animals.count)
     print(animals.contains("dog") )//true
        animals.insert("pig", at: 0)
//        print(animals.append("horse"))
//        print(animals.remove(at: 0))
//        animals.removeAll()
          print(animals)
//        print(animals.isEmpty)//判断数组是否为空
        var varA = "ValueA"
        var varB = 1008.00
        print("Value of \(varA) is more than \(varB) millions")//Value of ValueA is more than 1008.0 millions
        var myString:String?
        myString="hello"
//        if myString != nil {
//            print(myString)
//        }else{
//            print("myString has nil value")
//        }
        if let yourString = myString {
            print("your string has-\(yourString)")//your string has-hello

        }
        else{
            print("your string does not have a value")
        }
        let constA=42
        print( constA)
        let  constB:Float = 3.14159
        print(constB)
        print(display(no1:100))
        vari(members:1,2,3)
        print(inputs(no1: 123, no2: 5))
//        var studentDetail = Student.Name("swift")
//        var studentMark = Student.Mark(12, 14, 17)
//        switch studentMark {
//        case .Name(let studName):
//            print("Student name is: \(studName).")
//        case .Mark(let Mark1, let Mark2, let Mark3):
//            print("Student Marks are: \(Mark1),\(Mark2),\(Mark3).")
//        default:
//            print("Nothing")
//
//        }
        let yearMonth = Month.May.rawValue
        print("Value of the Month is: \(yearMonth).")
        

    }
    func display(no1: Int) -> Int {
        let a = no1
        return a
    }
    func vari<N>(members: N...){
        for i in members {
            print("打印\(i)")
        }
    }
    func inputs(no1: Int, no2: Int) -> Int {
        return no1/no2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

