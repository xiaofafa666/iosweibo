//
//  VisitorView.swift
//  iSemester
//
//  Created by apple on 2020/5/19.
//  Copyright © 2020年 Nglede. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    /*
     游客视图的布局控件
    */
    
    public lazy var iconView = UIImageView(image:UIImage(named:"visitordiscover_feed_image_smallicon"))
    public lazy var homeIconView:UIImageView = UIImageView(image:UIImage(named:"visitordiscover_feed_image_house"))
    public lazy var maskIconView:UIImageView = UIImageView(image:UIImage(named:"visitordiscover_feed_mask_smallicon"))
    
    public lazy var messageLable:UILabel={
        let label=UILabel()
        label.text="关注一些人，回这里看看有什么惊喜"
        label.textColor=UIColor.darkGray
        label.font=UIFont.systemFont(ofSize: 14)
        label.numberOfLines=0
        label.textAlignment=NSTextAlignment.center
        return label
    }()
    
    public lazy var registerButton:UIButton={
        let button=UIButton()
        button.setTitle("注册", for: .normal)
        button.setTitleColor(UIColor.orange,for: .normal)
        button.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: .normal)
        return button
    }()
    
    public lazy var loginButton:UIButton={
        let button=UIButton()
        button.setTitle("登陆", for: .normal)
        button.setTitleColor(UIColor.orange,for: .normal)
        button.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: .normal)
        return button
    }()
    
    // init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setupUI()
    }
}
extension VisitorView
{
    /*
     添加控件 及控件定位
    */
    public func setupUI()
    {
        addSubview(iconView)
        addSubview(homeIconView)
        addSubview(messageLable)
        addSubview(registerButton)
        addSubview(loginButton)
        addSubview(maskIconView)
        for v in subviews
        {
            v.translatesAutoresizingMaskIntoConstraints=false
        }
        
        // 居中logo
        addConstraints([NSLayoutConstraint(item: iconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0)])
        addConstraints([NSLayoutConstraint(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60)])
        
        addConstraints([NSLayoutConstraint(item: homeIconView, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0)])
        addConstraints([NSLayoutConstraint(item: homeIconView, attribute: .centerY, relatedBy: .equal, toItem: iconView, attribute: .centerY, multiplier: 1.0, constant: 0)])
        
        // 文本
        addConstraints([NSLayoutConstraint(item: messageLable, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0)])
        addConstraints([NSLayoutConstraint(item: messageLable, attribute: .centerY, relatedBy: .equal, toItem: iconView, attribute: .bottom, multiplier: 1.0, constant: 16)])
        addConstraints([NSLayoutConstraint(item: messageLable, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 224)])
        addConstraints([NSLayoutConstraint(item: messageLable, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36)])
        
        // 注册按钮
        addConstraints([NSLayoutConstraint(item: registerButton, attribute: .left, relatedBy: .equal, toItem: messageLable, attribute: .left, multiplier: 1.0, constant: 0)])
        addConstraints([NSLayoutConstraint(item: registerButton, attribute: .top, relatedBy: .equal, toItem: messageLable, attribute: .bottom, multiplier: 1.0, constant: 16)])
        addConstraints([NSLayoutConstraint(item: registerButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)])
        addConstraints([NSLayoutConstraint(item: registerButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36)])
        // 登陆按钮
        addConstraints([NSLayoutConstraint(item: loginButton, attribute: .right, relatedBy: .equal, toItem: messageLable, attribute: .right, multiplier: 1.0, constant: 0)])
        addConstraints([NSLayoutConstraint(item: loginButton, attribute: .top, relatedBy: .equal, toItem: messageLable, attribute: .bottom, multiplier: 1.0, constant: 16)])
        addConstraints([NSLayoutConstraint(item: loginButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)])
        addConstraints([NSLayoutConstraint(item: loginButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36)])
    
        // 遮罩效果
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[mask]-0-|", options: [], metrics: nil, views: ["mask":maskIconView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[mask]-(btnHeight)-[regButton]", options: [], metrics: ["btnHeight":-36], views: ["mask":maskIconView,"regButton":registerButton]))
        backgroundColor=UIColor(white:237.0/255.0, alpha:1.0)
    }
    
    public func setupInfo(imageName:String?,title:String)
    {
        messageLable.text=title
        guard let imageName = imageName else
        {
            startAnim()
            return
        }
        homeIconView.isHidden=true
        self.sendSubview(toBack: maskIconView)
        iconView.image = UIImage(named:imageName)
    }
    
    public func  startAnim()
    {
        let anim = CABasicAnimation(keyPath:"transform.rotation")
        anim.toValue = 2*M_PI
        anim.repeatCount = MAXFLOAT
        anim.duration = 20
        anim.isRemovedOnCompletion = false
        
        iconView.layer.add(anim, forKey: nil)
        
    
        
    }
}
