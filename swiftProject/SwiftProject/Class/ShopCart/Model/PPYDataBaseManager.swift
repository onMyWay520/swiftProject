//
//  PPYDataBaseManager.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/15.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

import UIKit
import FMDB
class PPYDataBaseManager: NSObject {
    static let shared: PPYDataBaseManager = PPYDataBaseManager()
    override init() {
        super.init()
        createDatabase()
    }
    //判断表是否存在
    func isTableExist(tableName : String)  -> Bool {
        let db = fmdb()
        let sql = "select count(*) as 'count' from sqlite_master where type ='table' and name = ?"
        if db.open() {
            do{
                let rs = try db.executeQuery(sql, values: [tableName])
                while rs.next() {
                    let count = rs.int(forColumn: "count")
                    if count > 0{
                        return true
                    }
                    else{
                        return false
                    }
                }
            }
            catch {
                print("failed : \(error.localizedDescription)")
            }
        }
        return false
    }

    // MARK: 创建数据库
    func fmdb()->FMDatabase{
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, .userDomainMask, true).last!
        return FMDatabase.init(url: URL.init(string: path + "/shopCart.sqlite")!)
    }
  // MARK: 创建库文件、新建表
    func createDatabase() {
      let  db = fmdb()
      if db.open(){
        let createContractTableQuery = "create table if not exists 'shopCart'(goodsId integer primary key , title text not null, desc text not null,count integer ,newPrice text ,oldPrice text ,iconName text,selected  bool,alreadyAddShoppingCart bool)"
          do{ // 注意: 在FMDB中, 除了查询以外的操作都称之为更新
            try 
             db.executeUpdate(createContractTableQuery, values: nil)
            }
        
            catch {
                  print("Could not create table.")
                  print(error.localizedDescription)
            }
                    
          // 关闭数据库
          db.close()
         }
         else{
            
             print("Could not open database.")
                
        }
//        return created;
    }
 // MARK: 打开数据库
    func openDatabase() -> Bool{
        //确认database对象是否被初始化，如果为nil，那么判断路径是否存在并创建
        //如果database对象存在，打开数据库，返回真，表示打开成功，否则数据库文件不存在或者发生了其它错误
        let db = fmdb()

        if !db.open(){

           return false
        }
        else{
            
          return true
        }
    }
   // MARK: 获取所有数据
    func loadGoods() -> [PPYGoodsModel]! {
        var goods:[PPYGoodsModel]!
        let db = fmdb()
        if db.open(){
            let query = "select * from shopCart"
            do{
            
                let results = try db.executeQuery(query, values: [])
                while results.next(){
                    let model = PPYGoodsModel();
                    model.title = results.string(forColumn: "title")
                    model.iconName = results.string(forColumn: "iconName")
                    model.desc = results.string(forColumn: "desc")
                    model.goodsId = Int(results.int(forColumn: "goodsId"))
                    model.newPrice =  results.string(forColumn: "newPrice")
                    model.oldPrice =  results.string(forColumn: "oldPrice")
                    model.selected = Bool(results.bool(forColumn: "selected"))
                model.alreadyAddShoppingCart=Bool(results.bool(forColumn: "alreadyAddShoppingCart"))
                    model.count = Int(results.int(forColumn: "count"))
                 
                    if goods == nil{
                        goods = [PPYGoodsModel]()
                    }
                    goods.append(model)
                }
            }catch{
                print(error.localizedDescription)
            }
            db.close()
        }
        return goods
    }
   // MARK: 增
    func insertshopCartData(model : PPYGoodsModel){
        let db = fmdb()
        if db.open(){
            let insertshopCartInfo = String.init(format: "insert into shopCart (title, desc,newPrice,oldPrice,iconName,goodsId,selected,count,alreadyAddShoppingCart) values ('%@','%@','%@','%@','%@',%d,%d,%d,%d);", model.title!,model.desc!,model.newPrice!,model.oldPrice!,model.iconName!,model.goodsId,model.selected,model.count,model.alreadyAddShoppingCart);
            do{
                try db.executeUpdate(insertshopCartInfo, values: [model.goodsId,model.alreadyAddShoppingCart])
                
            }
            catch{
                print(error.localizedDescription)
            }
            db.close()
        }
    }
    // MARK: 删
    func deleteshopCart(mode : PPYGoodsModel){
        let db = fmdb()
        
        if db.open() {
            let deleteQuery = String.init(format: "delete from shopCart where goodsId = %d", mode.goodsId)
            do{
                try db.executeUpdate(deleteQuery, values: [mode.goodsId])
            }catch{
                print(error.localizedDescription)
            }
            db.close()
        }
    }
    // MARK: 更
    func updateshopCart(model : PPYGoodsModel) {
        let db = fmdb()
        if db.open() {
            let query = String.init(format: "update shopCart set title = '%@',desc = '%@',newPrice = '%@',oldPrice = '%@',iconName = '%@',count = %d ,selected = %d,alreadyAddShoppingCart =%d  where goodsId = %d", model.title!,model.desc!,model.newPrice!,model.oldPrice!, model.iconName!,model.count, model.selected, model.alreadyAddShoppingCart,model.goodsId)
            do{
                try db.executeUpdate(query, values: [model.count,model.goodsId])
            }catch{
                print(error.localizedDescription)
            }
            db.close()
        }
    }
    //
    func selectShopCartgoods(goodsId:Int) ->Array <PPYGoodsModel>{
        var goods=Array<Any>()
        let db = fmdb()
        if db.open(){
            let query = String.init(format: "select *from shopCart where goodsId = %d", goodsId)
            do{
                
                let results = try db.executeQuery(query, values: [])
                while results.next(){
                    let model = PPYGoodsModel();
                    model.title = results.string(forColumn: "title")
                    model.iconName = results.string(forColumn: "iconName")
                    model.desc = results.string(forColumn: "desc")
                    model.goodsId = Int(results.int(forColumn: "goodsId"))
                    model.newPrice =  results.string(forColumn: "newPrice")
                    model.oldPrice =  results.string(forColumn: "oldPrice")
                    model.selected = Bool(results.bool(forColumn: "selected"))
                    model.alreadyAddShoppingCart=Bool(results.bool(forColumn: "alreadyAddShoppingCart"))
                    model.count = Int(results.int(forColumn: "count"))
                    goods.append(model)
    
                    
                }
            }catch{
                print(error.localizedDescription)
            }
            db.close()
        }
        return goods as! Array<PPYGoodsModel>
    }
}
