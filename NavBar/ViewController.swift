//
//  ViewController.swift
//  NavBar
//
//  Created by XingfuQiu on 2018/12/29.
//  Copyright © 2018 XingfuQiu. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "首页"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(ViewController.nextAction))
        let navImage = UIImageView(frame: navigationBar.bounds)
        navImage.image = #imageLiteral(resourceName: "nav_bg1")
        navigationBar.addSubview(navImage)
    }
    
    @objc func nextAction() {
        let vc = SecondViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }

}

