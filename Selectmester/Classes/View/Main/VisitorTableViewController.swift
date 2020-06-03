//
//  VisitorTableViewController.swift
//  iSemester
//
//  Created by apple on 2020/5/19.
//  Copyright © 2020年 Nglede. All rights reserved.
//

import UIKit
// 游客布局 被其他视图继承
class VisitorTableViewController: UITableViewController {
    
    public var userLogin=false
    public var visitorView:VisitorView?
    override func loadView() {
        userLogin ? super.loadView() : setupVisiterView()
    }
    
    // 预加载
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }


    public func setupVisiterView()
    {
        visitorView = VisitorView()
        view = visitorView
        
        view.backgroundColor = UIColor.white
    }

}
