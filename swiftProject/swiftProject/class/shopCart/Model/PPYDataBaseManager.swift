//
//  PPYDataBaseManager.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/15.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit
import FMDB
class PPYDataBaseManager: NSObject {
    static let shared: PPYDataBaseManager = PPYDataBaseManager();
    var pathToDatabase : String!;
    var database : FMDatabase!;
    class func getDatabase()->FMDatabase{
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, .userDomainMask, true).last!
        return FMDatabase.init(url: URL.init(string: path + "/shopCart.sqlite")!)
    }
    //创建库文件、新建表
    func createDatabase() -> Bool {
        var created = false
        if !FileManager.default.fileExists(atPath: pathToDatabase) {
            database = FMDatabase(path: pathToDatabase);
            if database != nil{
                // 数据库是否被打开
                if database.open(){
                    let createContractTableQuery = "create table shopCart(goodsId integer primary key  not null, title text not null, desc text not null,count integer )"
                    do{
                        try database.executeUpdate(createContractTableQuery, values: nil)
                        created = true
                    }catch{
                        print("Could not create table.")
                        print(error.localizedDescription)
                    }
                    
                    // 关闭数据库
                    database.close()
                }else{
                    print("Could not open database.")
                }
            }
        }
        return created;
    }
    //打开数据库
    func openDatabase() -> Bool{
        //确认database对象是否被初始化，如果为nil，那么判断路径是否存在并创建
        if database == nil{
            if FileManager.default.fileExists(atPath: pathToDatabase){
                database = FMDatabase(path: pathToDatabase)
            }
        }
        //如果database对象存在，打开数据库，返回真，表示打开成功，否则数据库文件不存在或者发生了其它错误
        if database != nil{
            if database.open(){
                return true
            }
        }
        return false
    }
    //获取所有数据
    func loadGoods() -> [PPYGoodsModel]! {
        var goods:[PPYGoodsModel]!
        if openDatabase(){
            let query = "select * from shopCart"
            do{
                print(database)
                let results = try database.executeQuery(query, values: [])
                while results.next(){
                    let model = PPYGoodsModel();
                    model.title = results.string(forColumn: "title")
                    model.desc = results.string(forColumn: "desc")
                    model.goodsId = Int(results.int(forColumn: "goodsId"))
                    if goods == nil{
                        goods = [PPYGoodsModel]()
                    }
                    goods.append(model)
                }
            }catch{
                print(error.localizedDescription)
            }
            database.close()
        }
        return goods
    }
    //增
    func insertshopCartData(model : PPYGoodsModel) -> Bool {
        var isInserted = false
        if openDatabase(){
            let insertshopCartInfo = String.init(format: "insert into shopCart (title, desc) values ('%@','%@');", model.title!,model.desc!);
            do{
                try database.executeUpdate(insertshopCartInfo, values: [model.goodsId])
                isInserted = true
            }catch{
                print(error.localizedDescription)
            }
            database.close()
        }
        return isInserted;
    }
    //删
    func deleteshopCart(mode : PPYGoodsModel) -> Bool {
        var isDeleted = false
        if openDatabase() {
            let deleteQuery = String.init(format: "delete from shopCart where goodsId = %d", mode.goodsId)
            do{
                try database.executeUpdate(deleteQuery, values: [mode.goodsId])
                isDeleted = true
            }catch{
                print(error.localizedDescription)
            }
            database.close()
        }
        return isDeleted;
    }
    //更
    func updateshopCart(model : PPYGoodsModel) -> Bool {
        var isUpdated = false
        if openDatabase() {
            let query = String.init(format: "update shopCart set title = '%@',desc = '%@' where goodsId = %d", model.title!,model.desc!,model.goodsId)
            do{
                try database.executeUpdate(query, values: [model.goodsId])
                isUpdated = true
            }catch{
                print(error.localizedDescription)
            }
            database.close()
        }
        return isUpdated;
    }



}
