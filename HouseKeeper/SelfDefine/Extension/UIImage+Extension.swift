//
//  UIImage+Extension.swift
//  HouseKeeper
//
//  Created by Megatron on 09/05/2017.
//  Copyright © 2017 Megatron. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    //  MARK: 获取对应颜色的图片
    class func createImageColor(color:UIColor) ->(UIImage){
        let rect = CGRect.init(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let contex = UIGraphicsGetCurrentContext()
        contex!.setFillColor(color.cgColor)
        contex!.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
