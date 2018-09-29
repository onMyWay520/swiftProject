//
//  PPYkeyWordsVC.swift
//  swiftProject
/* 与声明有关的关键字：class、deinit、enum、extension、func、import、init、let、protocol、static、struct、subscript、typealias和var。
  与语句有关的关键字：break、case、continue、default、do、else、fallthrough、if、in、for、return、switch、where和while。
  表达式和类型关键字：as、dynamicType、is、new、super、self、Self、Type、__COLUMN__、__FILE__、__FUNCTION__和__LINE__。
  在特定上下文中使用的关键字：associativity、didSet、get、infix、inout、left、mutating、none、nonmutating、operator、override、postfix、precedence、prefix、rightset、unowned、unowned(safe)、unowned(unsafe)、weak和willSet。*/
//  Created by wuyongchao on 2018/9/29.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit
/*在Swift中, 我们使用struct关键字去声明结构体，Swift中的结构体并不复杂，与C语言的结构体相比，除了成员变量，还多了成员方法。使得它更加接近于一个类。个人认为可以理解为是类的一个轻量化实现*/
struct Person {
    var name:String
    var age:Int
    
    func introduce(){
        print("我叫：\(name),今年\(age)岁")
    }
}
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
/*在Swift中, 我们使用enum关键字去声明枚举。枚举是一种常见的数据类型，他的主要功能就是将某一种有固定数量可能性的变量的值，以一组命名过的常数来指代*/
enum Orientation:Int{
    case East
    case West
    case South
    case North
}
class Fruit{
    //修饰词 final 表示 不可重写 可以将类或者类中的部分实现保护起来,从而避免子类破坏
    final  func price(){
        print("price")
    }
    // 使用static关键字创建类方法
    static func ageOfPerson(name: String) {
        print("Type Method: Person name: \(name)")
    }
}
class Apple : Fruit {//类继承
    //        //重写父类方法
//    override func price() {
//       print("重写父类的price 方法")
//    }
  //用static关键字指定的方法是类方法，他是不能被子类重写的
    
    
}
/*Swift中，mutating关键字指的是可变即可修改。用在structure和enumeration中,虽然结构体和枚举可以定义自己的方法，但是默认情况下，实例方法中是不可以修改值类型的属性。为了能够在实例方法中修改属性值，可以在方法定义前添加关键字mutating*/
struct rect {
    var width = 0,height = 0
    mutating func changeRect(x:Int, y:Int) {
        self.width += x
        self.height += y
    }
    
}
enum Direction {
    case Top, Left, Right, Bottom
    mutating func lookDirection() {
        switch self {
        case .Top:
            self = .Top
        case .Left:
            self = .Left
        case .Right:
            self = .Right
        case .Bottom:
            self = .Bottom
        }
        print("self === \(self)")
    }
}
class PPYkeyWordsVC: PPYBaseTableViewController {
    //在Swift中, 如果我们要重写某个方法, 或者某个属性的话, 我们需要在重写的变量前增加一个override关键字
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="关键字演练"
  self.dataArray=["struct","enum","subscript","mutating"]
    self.mainView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "CellId")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
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
        let cellID = "CellId"
        var cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier:cellID, for: indexPath)
        if cell==nil {
            cell=UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:cellID)
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textLabel?.text=self.dataArray[indexPath.section] as? String
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        let alertController = UIAlertController(title: self.dataArray[indexPath.section] as? String,
                                                message: "", preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: .default, handler: {
            action in
            switch indexPath.section{
            case  0:
                self.showStruct()
                break
            case  1:
                self.showEnum()
                break
            case  2:
                self.showSubscript()
                break
            case  3:
                self.showMutating()
                break
               
            default: break
                
            }
            
        })
//        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func showStruct(){
        var person = Person(name: "xiaoMing",age: 20)
        person.name = "xiaoMing"
        print("person.name = \(person.name)")
        person.introduce()
    }
    func showEnum() {
        
        print(Orientation.South.rawValue)
    }
    func showSubscript() {
        var matrix = Matrix(rows: 2, columns: 2)
        matrix[0, 1] = 1.5
        matrix[1, 0] = 3.2
        print("matrix == \(matrix)")
        /**
         打印结果：
         matrix == Matrix(rows: 2, columns: 2, grid: [0.0, 1.5, 3.2000000000000002, 0.0])
         
         */
    }
    
    func showMutating() {
        var re = rect(width: 5, height: 5)
        re.changeRect(x: 32, y: 15)
        print("re = \(re)")
        
        /**
         打印结果为：re = rect(width: 37, height: 20)
         */
        
        var dir = Direction.Left
        dir.lookDirection()
        /**
         打印结果为：self === Left
         */
    }
}
