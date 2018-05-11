//
//  MainVC.swift
//  HouseKeeper
//
//  Created by Megatron on 08/05/2017.
//  Copyright © 2017 Megatron. All rights reserved.
//

import UIKit
import SnapKit

class MainVC: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var listData : [(id: Int64, money: Float64, type: Int64 , date : String ,description : String)]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor.white
        
        let destName = NSString.getSqliteTableNameDate()
        let sqlite = SqliteManager(name: destName)
        sqlite.removeTable()
        
        self.view.addSubview(self.listTable)
        self.view.addSubview(self.addBtn!)
        
        self.configUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadLocalRecord()
        listTable.reloadData()
    }
    
    // MARK: Date Init
    func loadLocalRecord() -> (){
        // 获取当前年月
        let destName = NSString.getSqliteTableNameDate()
        let sqlite = SqliteManager(name: destName)
        
        listData = sqlite.readData()
        listData.remove(at: 0)
    }
    
    // MARK: Event Response
    // 添加记录按钮点击事件
    func addRecordButtonClicked(sender:UIButton) -> () {
        let vc = AddRecordTypeSelectVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.listData == nil ? 0 : self.listData.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "identifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        let data = listData[indexPath.row]
        cell?.textLabel?.text = "\(data.date)       消费\(data.money)元"
        
        return cell!
    }
    
    // MARK: UIConfig
    // 配置UI
    func configUI() -> () {
        self.addBtn?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-20)
            make.width.equalTo(50)
            make.height.equalTo(50)
        })
        
        self.listTable.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.height.equalTo(self.view).multipliedBy(0.5)
        }
    }
    
    // MARK: Lazy Load
    lazy var addBtn : UIButton? = {
        var btn = UIButton.init()
        btn.backgroundColor = UIColor.clear
        btn.setImage(UIImage.init(named: "addBtn"), for: UIControlState.normal)
        btn.addTarget(self, action: #selector(addRecordButtonClicked(sender:)), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    lazy var listTable : UITableView = {
        var table = UITableView.init()
        table.rowHeight = 50
        table.delegate = self
        table.dataSource = self
        
        return table
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
