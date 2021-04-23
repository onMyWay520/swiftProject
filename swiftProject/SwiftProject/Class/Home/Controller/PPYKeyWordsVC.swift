//
//  PPYKeyWordsVC.swift
//  swiftProject
/* 与声明有关的关键字：class、deinit、enum、extension、func、import、init、let、protocol、static、struct、subscript、typealias和var。
  与语句有关的关键字：break、case、continue、default、do、else、fallthrough、if、in、for、return、switch、where和while。
  表达式和类型关键字：as、dynamicType、is、new、super、self、Self、Type、__COLUMN__、__FILE__、__FUNCTION__和__LINE__。
  在特定上下文中使用的关键字：associativity、didSet、get、infix、inout、left、mutating、none、nonmutating、operator、override、postfix、precedence、prefix、rightset、unowned、unowned(safe)、unowned(unsafe)、weak和willSet。*/
//  Created by wuyongchao on 2018/9/29.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
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
    var name :String
    required init(name :String){
        self.name = name
    }

}
/*
 在swift中，extension和oc的category有点类似，但是extension比起category来说更加强大和灵活，他不仅可以扩展某种类型或结构体的方法，同时他还可以与protocol等结合使用，他可以为特定的class，struct，enum或者protocol添加新的特性
 
 */
/*swift中的扩展extension
 1.定义实例方法和类型方法
 2.添加计算型属性和计算静态属性
 3。定义下标
 4，提供新的构造器
 5，定义和使用新的嵌套类型
 6，使一个已有类型符合某个接口*/
extension Fruit{
    func weight(){
        print("重10斤")
    }
   
}
class Apple : Fruit {//类继承
    //        //重写父类方法
//    override func price() {
//       print("重写父类的price 方法")
//    }
  //用static关键字指定的方法是类方法，他是不能被子类重写的
    
    //如果子类需要添加异于父类的初始化方法时，必须先要实现父类中使用required修饰符修饰过的初始化方法，并且也要使用required修饰符而不是override。
    required init(name: String) {
        super.init(name: name)
    }
    /*注意：
    （1）required修饰符只能用于修饰类初始化方法。
    （2）当子类含有异于父类的初始化方法时（初始化方法参数类型和数量异于父类），子类必须要实现父类的required初始化方法，并且也要使用required修饰符而不是override。
    （3）当子类没有初始化方法时，可以不用实现父类的required初始化方法。
     */
    
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
extension UIButton{
    //swit中类方法是以class开头的方法，类似于oc中+开头的方法
    class func createButton(imageName:String)->UIButton{
        let btn=UIButton()
        btn.setImage(UIImage(named:imageName), for: .normal)
        btn.sizeToFit()
        return btn
    }
    /*
     convenience:便利，使用convenience修饰的构造函数叫做便利构造函数
     便利构造函数通常用在对系统的类进行构造函数的扩充时使用。
     */
    /*便利构造函数有如下几个特点：
     （1）便利构造函数通常都是写在extension里面
      （2）便利函数init前面需要加载convenience
      （3）在便利构造函数中需要明确的调用self.init()
     */
    convenience init(title:String,color:UIColor,bgColor:UIColor){
        self.init()
        setTitle(title, for: .normal)
        setTitleColor(color, for: .normal)
        self.backgroundColor=bgColor
        sizeToFit()
    }
}
class PPYKeyWordsVC: PPYBaseTableViewController {
    //在Swift中, 如果我们要重写某个方法, 或者某个属性的话, 我们需要在重写的变量前增加一个override关键字
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="关键字演练";       self.dataArray=["struct","enum","subscript","mutating","extensions","convenience"]
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
            case  4:
                self.showExtensions()
                break
            case  5:
                self.showConvenience()
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
    func showExtensions()  {
        let fru = Fruit(name: "橘子")
        fru.weight()
        
    }
    func showConvenience(){
//        title: "你好", color: UIColor.red
        let btn = UIButton.init(title: "你好", color: UIColor.red, bgColor: UIColor.blue)
        btn.frame=CGRect.init(x: 80, y: 120, width: 100, height: 30)
        self.view.addSubview(btn)
    }
    deinit {
        //释放
        /*在Swift中，deinit属于析构函数，当对象结束其生命周期时（例如对象所在的函数已调用完毕），系统自动执行析构函数。和OC中的dealloc 一样的,通常在deinit和dealloc中需要执行的操作有：
          （1）对象销毁
          （2）KVO移除
          （3）移除通知
          （4）NSTimer销毁*/
    }
}
