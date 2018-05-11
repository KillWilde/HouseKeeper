//
//  CYNavBar.swift
//  HouseKeeper
//
//  Created by Megatron on 09/05/2017.
//  Copyright © 2017 Megatron. All rights reserved.
//

import UIKit

@objc protocol CYNavBarDelegate : NSObjectProtocol {
    @objc optional func navBtnRightClicked()
    @objc optional func navBtnLeftClicked()
}

class CYNavBar: UINavigationBar {
    enum  CYNavBarButtonStyle{
        case image
        case text
        case none
    }
    
    weak var myDelegate : CYNavBarDelegate?
    
    //  MARK: initializer
    class func myInit(name:String?,leftStyle:CYNavBarButtonStyle,leftName:String,rightStyle:CYNavBarButtonStyle,rightName:String) -> (CYNavBar) {
        let bar = CYNavBar.init()
        
        if name != nil{
            bar.midTitle.text = name
            bar.myNavItem.titleView = bar.midTitle
        }
        
        if leftStyle == .image {
            let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil,action: nil)
            spacer.width = -15;
            
            bar.leftButtonImg.setImage(UIImage.init(named: leftName), for: UIControlState.normal)
            let left = UIBarButtonItem.init(customView: bar.leftButtonImg)
            bar.myNavItem.setLeftBarButtonItems([spacer,left], animated: true)
        }
        else if leftStyle == .text
        {
            let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil,action: nil)
            spacer.width = -15;
            
            bar.leftButtonText.setTitle(leftName, for: UIControlState.normal)
            let left = UIBarButtonItem.init(customView: bar.leftButtonText)
            bar.myNavItem.setLeftBarButtonItems([spacer,left], animated: true)
        }
        
        if rightStyle == .image {
            let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil,action: nil)
            spacer.width = -15;
            
            bar.rightButtonImg.setImage(UIImage.init(named: rightName), for: UIControlState.normal)
            let right = UIBarButtonItem.init(customView: bar.rightButtonImg)
            bar.myNavItem.setRightBarButtonItems([spacer,right], animated: true)
        }
        else if rightStyle == .text
        {
            let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil,action: nil)
            spacer.width = -15;
            
            bar.rightButtonText.setTitle(rightName, for: UIControlState.normal)
            let right = UIBarButtonItem.init(customView: bar.rightButtonText)
            bar.myNavItem.setRightBarButtonItems([spacer,right], animated: true)
        }
        
        bar.pushItem(bar.myNavItem, animated: true)
        
        return bar
    }
    
    //  MARK: Event Response
    func leftButtonClicked(sender:UIButton) -> () {
        if self.myDelegate != nil {
            self.myDelegate?.navBtnLeftClicked!()
        }
    }
    
    func rightButtonClicked(sender:UIButton) -> () {
        if self.myDelegate != nil {
            self.myDelegate?.navBtnRightClicked!()
        }
    }
    
    //  MARK: Lazy Load
    lazy var leftButtonImg : UIButton = {
        var tempBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40))
        tempBtn.addTarget(self, action: #selector(leftButtonClicked(sender:)), for: UIControlEvents.touchUpInside)
        
        return tempBtn
    }()
    
    lazy var leftButtonText : UIButton = {
        var tempBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 80, height: 40))
        tempBtn.titleLabel?.textAlignment = NSTextAlignment.left
        tempBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        tempBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        tempBtn.addTarget(self, action: #selector(leftButtonClicked(sender:)), for: UIControlEvents.touchUpInside)
        
        return tempBtn
    }()
    
    lazy var rightButtonImg : UIButton = {
        var tempBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40))
        tempBtn.addTarget(self, action: #selector(rightButtonClicked(sender:)), for: UIControlEvents.touchUpInside)
        
        return tempBtn
    }()
    
    lazy var rightButtonText : UIButton = {
        var tempBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 80, height: 40))
        tempBtn.titleLabel?.textAlignment = NSTextAlignment.right
        tempBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        tempBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        tempBtn.addTarget(self, action: #selector(rightButtonClicked(sender:)), for: UIControlEvents.touchUpInside)
        tempBtn.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: -30)
        
        return tempBtn
    }()
    
    lazy var midTitle : UILabel = {
        var tempLb = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 40))
        tempLb.font = UIFont.systemFont(ofSize: 16)
        tempLb.textAlignment = NSTextAlignment.center
        
        return tempLb
    }()
    
    lazy var myNavItem : UINavigationItem = {
       var tempItem = UINavigationItem.init()
        
       return tempItem
    }()
}
