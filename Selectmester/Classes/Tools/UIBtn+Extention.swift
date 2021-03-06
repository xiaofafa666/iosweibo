//
//  UIBtn+Extention.swift
//  iSemester
//
//  Created by apple on 2020/5/19.
//  Copyright © 2020年 Nglede. All rights reserved.
//

import UIKit
extension UIButton
{
    convenience init(imageName:String,backImageName:String)
    {
        self.init()
        setImage(UIImage(named:imageName), for: .normal)
        setImage(UIImage(named:imageName+"_highlighted"), for: .highlighted)
        
        setBackgroundImage(UIImage(named:backImageName), for: .normal)
        setBackgroundImage(UIImage(named:backImageName+"_.highlighted"), for: .highlighted)
        
        sizeToFit()
    }
}
