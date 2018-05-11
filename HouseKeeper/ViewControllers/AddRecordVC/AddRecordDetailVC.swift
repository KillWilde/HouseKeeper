//
//  AddRecordDetailVC.swift
//  HouseKeeper
//
//  Created by Megatron on 09/05/2017.
//  Copyright © 2017 Megatron. All rights reserved.
//

import UIKit

class AddRecordDetailVC: UIViewController ,CYNavBarDelegate,UITextFieldDelegate{

    enum AddRecordDetailVCType {
        case income
        case cost
    }
    
    var myType : AddRecordDetailVCType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        self.view.addGestureRecognizer(tap)
        
        self.view.addSubview(self.myNavBar!)
        self.view.addSubview(self.txMoney!)
        self.view.addSubview(self.txConsumeType!)
        self.view.addSubview(self.txDate!)
        
        self.configUI()
    }
    
    // MARK: Event Response
    func tapAction(sender:UITapGestureRecognizer) -> () {
        self.txMoney?.resignFirstResponder()
        self.txConsumeType?.resignFirstResponder()
        self.txDate?.resignFirstResponder()
    }
    
    // MARK: Delegate
    func navBtnLeftClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func navBtnRightClicked() {
        if self.myType == AddRecordDetailVCType.income{
            let destName = NSString.getSqliteTableNameDate()
            let sqliteContext = SqliteManager(name: destName)
            
            sqliteContext.insertData(_money: Float64((self.txMoney?.text)!)!,_type: Int64((self.txConsumeType?.text)!)!,_date: (self.txDate?.text)!, _description: "")

            self.navigationController?.popToRootViewController(animated: true)
        }
        else
        {
            let destName = NSString.getSqliteTableNameDate()
            let sqliteContext = SqliteManager(name: destName)
            
            sqliteContext.insertData(_money: Float64((self.txMoney?.text)!)!,_type: Int64((self.txConsumeType?.text)!)!,_date: (self.txDate?.text)!, _description: "")
            
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    // MARK: UIConfig
    func configUI() -> () {
        self.myNavBar?.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.top.equalTo(self.view)
            make.height.equalTo(64)
        }
        
        self.txMoney?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.myNavBar!).offset(120)
            make.height.equalTo(40)
            make.width.equalTo(self.view).multipliedBy(0.6)
        })
        
        self.txConsumeType?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo((self.txMoney?.snp.bottom)!).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(self.view).multipliedBy(0.6)
        })
        
        self.txDate?.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo((self.txConsumeType?.snp.bottom)!).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(self.view).multipliedBy(0.6)
        }
    }
    
    // MARK: Lazy Load
    lazy var myNavBar : CYNavBar? = {
        var bar = CYNavBar.myInit(name: "添加新记录", leftStyle: CYNavBar.CYNavBarButtonStyle.image, leftName: "backBtn", rightStyle: CYNavBar.CYNavBarButtonStyle.text, rightName: "保存")
        bar.myDelegate = self
        
        return bar
    }()
    
    lazy var txMoney : UITextField? = {
        var txField = UITextField.init()
        txField.borderStyle = UITextBorderStyle.roundedRect
        txField.textAlignment = NSTextAlignment.center
        txField.placeholder = "数额"
        txField.delegate = self
        txField.keyboardType = UIKeyboardType.decimalPad
        
        return txField
    }()
    
    lazy var txConsumeType : UITextField? = {
        var txField = UITextField.init()
        txField.borderStyle = UITextBorderStyle.roundedRect
        txField.textAlignment = NSTextAlignment.center
        txField.placeholder = "消费类型"
        txField.delegate = self
        txField.keyboardType = UIKeyboardType.default
        
        return txField
    }()
    
    lazy var txDate : UITextField? = {
        var txField = UITextField.init()
        txField.borderStyle = UITextBorderStyle.roundedRect
        txField.textAlignment = NSTextAlignment.center
        txField.placeholder = "输入日期"
        txField.delegate = self
        txField.keyboardType = UIKeyboardType.decimalPad
        txField.text = NSString.getCurrentDate()
        
        return txField
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
