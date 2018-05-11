//
//  SqliteManager.swift
//  HouseKeeper
//
//  Created by Megatron on 10/05/2017.
//  Copyright © 2017 Megatron. All rights reserved.
//

import Foundation
import SQLite

struct SqliteManager{
    private var db : Connection!
    private var table : Table!
    private let id = Expression<Int64>("id")                        //主键
    private let money = Expression<Float64>("money")                //列表1
    private let consumetype = Expression<Int64>("consume_type")     //列表2
    private let date = Expression<String>("date")
    private let description = Expression<String>("description")
    
    init(name:String) {
        table = Table(name)
        
        createdsqlite3()
    }
    
    //创建数据库文件
    mutating func createdsqlite3(filePath: String = "/Documents")  {
        let sqlFilePath = NSHomeDirectory() + filePath + "/db.sqlite3"
        do {
            db = try Connection(sqlFilePath)
            try db.run((table.create { t in
                t.column(id, primaryKey: true)
                t.column(money)
                t.column(consumetype)
                t.column(date)
                t.column(description)
                }))
        } catch { print(error) }
    }
    
    //插入数据
    func insertData(_money: Float64, _type: Int64, _date : String, _description : String){
        do {
            let insert = table.insert(money <- _money, consumetype <- _type, date <- _date, description <- _description)
            try db.run(insert)
        } catch {
            print(error)
        }
    }
    
    //读取数据
    func readData() -> [(id: Int64, money: Float64, type: Int64 , date : String ,description : String)] {
        var userData = (id: Int64(0), money: Float64(0.1), type: Int64(0) , date : "" , description : "")
        var userDataArr = [userData]
        for table in try! db.prepare(table) {
            userData.id = table.get(id)
            userData.money = table.get(money)
            userData.type = table.get(consumetype)
            userData.date = table.get(date)
            userData.description = table.get(description)
            userDataArr.append(userData)
        }
        return userDataArr
    }
    
    // 删除表
    func removeTable() -> (){
        do {
            try db.run(table.delete())
        } catch  {
            
        }
    }
}
