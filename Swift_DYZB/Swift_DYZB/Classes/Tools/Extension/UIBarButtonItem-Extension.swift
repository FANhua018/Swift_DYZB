//
//  UIBarButtonItem-Extension.swift
//  Swift_DYZB
//
//  Created by ivan on 2018/6/13.
//  Copyright © 2018年 ivan. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    /*
    class func createItem(imageName:String,highImageName:String,size:CGSize)->UIBarButtonItem{
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        btn.frame = CGRect(origin: .zero, size: size)
        return UIBarButtonItem(customView: btn)
    }
    */
    
    //便利构造函数: 1.convenience开头 2.必须明确调用一个设计构造函数(self)
    convenience init(imageName:String,highImageName:String = "",size:CGSize = CGSize.zero){
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        if size == CGSize.zero {
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: .zero, size: size)
        }
        self.init(customView: btn)
    }
}
