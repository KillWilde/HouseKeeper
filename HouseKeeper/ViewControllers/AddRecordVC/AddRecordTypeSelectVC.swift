//
//  AddRecordTypeSelectVC.swift
//  HouseKeeper
//
//  Created by Megatron on 08/05/2017.
//  Copyright © 2017 Megatron. All rights reserved.
//

import UIKit

class AddRecordTypeSelectVC: UIViewController ,CYNavBarDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(self.myNavBar!)
        self.view.addSubview(self.btnIncome!)
        self.view.addSubview(self.btnCost!)
        
        self.configUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //  MARK: Delegate
    func navBtnLeftClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func navBtnRightClicked() {
        
    }
    
    // MARK: Event Response
    func btnIncomeClicked() -> () {
        let vc = AddRecordDetailVC()
        vc.myType = .income
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func btnCostClicked() -> () {
        let vc = AddRecordDetailVC()
        vc.myType = .cost
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: UIConfig
    func configUI() -> () {
        self.myNavBar?.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.top.equalTo(self.view)
            make.height.equalTo(64)
        }
        
        self.btnCost?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.top.equalTo((self.myNavBar?.snp.bottom)!).offset(20)
            make.bottom.equalTo((self.btnCost?.snp.top)!).offset(-20)
            make.height.equalTo(self.btnIncome!)
        })
        
        self.btnIncome?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.top.equalTo((self.btnCost?.snp.bottom)!).offset(20)
            make.bottom.equalTo((self.view.snp.bottom)).offset(-20)
        })
        
    }
    
    //  MARK: Lazy Load
    lazy var myNavBar : CYNavBar? = {
      var bar = CYNavBar.myInit(name: "选择记录类型", leftStyle: CYNavBar.CYNavBarButtonStyle.image, leftName: "backBtn", rightStyle: CYNavBar.CYNavBarButtonStyle.none, rightName: "")
        bar.myDelegate = self
        
        return bar
    }()
    
    lazy var btnIncome : UIButton? = {
        var btn = UIButton.init()
        btn.setTitle("收入", for: UIControlState.normal)
        btn.addTarget(self, action: #selector(btnIncomeClicked), for: UIControlEvents.touchUpInside)
        btn.setBackgroundImage(UIImage.createImageColor(color: UIColor.init(red: 138/255.0, green: 190/255.0, blue: 101/255.0, alpha: 1)), for: UIControlState.normal)
        btn.layer.cornerRadius = 5.0
        btn.layer.masksToBounds = true
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        
        return btn
    }()
    
    lazy var btnCost : UIButton? = {
        var btn = UIButton.init()
        btn.setTitle("支出", for: UIControlState.normal)
        btn.addTarget(self, action: #selector(btnCostClicked), for: UIControlEvents.touchUpInside)
        btn.setBackgroundImage(UIImage.createImageColor(color: UIColor.init(red: 224/255.0, green: 77/255.0, blue: 79/255.0, alpha: 1)), for: UIControlState.normal)
        btn.layer.cornerRadius = 5.0
        btn.layer.masksToBounds = true
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        
        return btn
    }()
}
