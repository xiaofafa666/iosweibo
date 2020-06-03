//
//  MainViewController.swift
//  iSemester
//
//  Created by apple on 2020/5/19.
//  Copyright © 2020年 Nglede. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    public lazy var composedButton:UIButton = UIButton(imageName:"tabbar_compose_icon_add",backImageName:"tabbar_compose_button")

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
        // NetwordTools.sharedTools.request(URLString:"http://www.weather.com.cn/data/sk/101010100.html",parameters:nil)
        NetwordTools.sharedTools.request(method: .GET, URLString: "http://httpbin.org/get", parameters: ["name":"zhangsan" as AnyObject,"age":18 as AnyObject], finish: {(result,error)->() in print(error)})
        
        NetwordTools.sharedTools.request(method: .POST, URLString: "http://httpbin.org/post", parameters: ["name":"zhangsan" as AnyObject,"age":18 as AnyObject], finish: {(result,error)->() in print(error)})
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainViewController
{
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.bringSubview(toFront: composedButton)
    }
    
    public func addChildViewControllers()
    {
        tabBar.tintColor=UIColor.orange
        addChildViewController(vc:HomeTableViewController(),title:"首页",imageName:"tabbar_home")
        addChildViewController(vc:MessageTableViewController(),title:"消息",imageName:"tabbar_message_center")
        addChildViewController(UIViewController())
        addChildViewController(vc:DiscoverTableViewController(),title:"发现",imageName:"tabbar_discover")
        addChildViewController(vc:ProfileTableViewController(),title:"我",imageName:"tabbar_profile")
        setupComposedButton()
    }
    private func addChildViewController(vc:UIViewController,title:String,imageName:String) {
        vc.title=title
        vc.tabBarItem.image=UIImage(named:imageName)
        let nav = UINavigationController(rootViewController: vc)
        addChildViewController(nav)
        
    }
    public func setupComposedButton(){
        tabBar.addSubview(composedButton)
        
        let count = childViewControllers.count
        let w = tabBar.bounds.width/CGFloat(count)-1
        composedButton.frame=CGRect(x: 2*w, y: 0.0, width: w, height: tabBar.bounds.height)
        composedButton.addTarget(self, action: #selector(MainViewController.clickComposedButton), for: .touchUpInside)
    }
    @objc
    public func clickComposedButton(){
        print("kkkkk")
    }
}
