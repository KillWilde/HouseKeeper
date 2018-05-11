//
//  LoginVC.swift
//  HouseKeeper
//
//  Created by Megatron on 01/06/2017.
//  Copyright © 2017 Megatron. All rights reserved.
//

import UIKit

class LoginVC: UIViewController ,UITextFieldDelegate{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(self.imgBG!)
        self.view.addSubview(self.txUserName!)
        self.view.addSubview(self.txPassword!)
        self.view.addSubview(self.btnLogin!)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(blankAreaClicked))
        self.view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.txUserName?.center.x -= self.view.bounds.size.width
        self.txPassword?.center.x -= self.view.bounds.size.width
        self.btnLogin?.center.x -= self.view.bounds.size.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration:0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.txUserName?.center.x += self.view.bounds.size.width
        }) { (complete) in
            UIView.animate(withDuration:0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                self.txPassword?.center.x += self.view.bounds.size.width
            }) { (complete) in
                UIView.animate(withDuration:0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                    self.btnLogin?.center.x += self.view.bounds.size.width
                }) { (complete) in
                    
                }
            }
        }
    }
    
    //  MARK:
    //  MARK: EventResponse
    func blankAreaClicked(){
        self.txPassword?.resignFirstResponder()
        self.txUserName?.resignFirstResponder()
    }
    
    func btnLoginClicked(){
        var message = ""
        if (self.txUserName?.text?.characters.count)! <= 0 {
            message = "用户名或密码不能为空"
        }
        
        if (self.txPassword?.text?.characters.count)! <= 0 {
            message = "用户名或密码不能为空"
        }
        
        if message.characters.count == 0 {
            if (self.txPassword?.text?.compare("1991").rawValue == 0 && self.txUserName?.text?.compare("anqi").rawValue == 0){
                self.navigationController?.popViewController(animated: true)
            }
            else
            {
                let alert = UIAlertController.init(title: "提示", message: "用户名或密码错误", preferredStyle: .alert)
                let action = UIAlertAction.init(title: "确定", style: .default) { (sender) in
                    
                }
                alert.addAction(action)
                
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            let alert = UIAlertController.init(title: "提示", message: message, preferredStyle: .alert)
            let action = UIAlertAction.init(title: "确定", style: .default) { (sender) in
                
            }
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //  MARK:
    //  MARK: Delegate
    //  MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.txPassword?.resignFirstResponder()
        self.txUserName?.resignFirstResponder()
        
        return true
    }
    
    //  MARK:
    //  MARK: Lazy Load
    lazy var txUserName : UITextField? = {
        let tx = UITextField.init()
        
        tx.borderStyle = UITextBorderStyle.roundedRect
        tx.placeholder = "用户名"
        tx.textAlignment = NSTextAlignment.center
        tx.frame = CGRect.init(x: 0, y: 0, width: 200, height: 40)
        tx.center.x = self.view.center.x
        tx.center.y = 200
        tx.delegate = self
        
        return tx
    }()
    
    lazy var txPassword : UITextField? = {
        let tx = UITextField.init()
        
        tx.borderStyle = UITextBorderStyle.roundedRect
        tx.placeholder = "密码"
        tx.textAlignment = NSTextAlignment.center
        tx.frame = CGRect.init(x: 0, y: 0, width: 200, height: 40)
        tx.center.x = self.view.center.x
        tx.center.y = 250
        tx.delegate = self
        
        return tx
    }()
    
    lazy var btnLogin : UIButton? = {
        var btn = UIButton.init(type: UIButtonType.system)
        btn.setTitle("登录", for: UIControlState.normal)
        btn.frame = CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: 200, height: 40))
        btn.center.y = 350
        btn.center.x = self.view.center.x
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
        btn.layer.borderColor = UIColor.red.cgColor
        btn.layer.borderWidth = 1
        btn.addTarget(self, action: #selector(btnLoginClicked), for: .touchUpInside)
        
        return btn;
    }()
    
    lazy var imgBG : UIImageView? = {
        var img = UIImageView.init()
        img.image = UIImage.init(named: "Login_BG.png");
        img.frame = self.view.frame
        
        return img
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
