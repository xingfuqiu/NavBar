//
//  ThirdViewController.swift
//  NavBar
//
//  Created by XingfuQiu on 2018/12/29.
//  Copyright © 2018 XingfuQiu. All rights reserved.
//

import UIKit

class ThirdViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "不透明"
        view.backgroundColor = UIColor.random
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(ThirdViewController.nextAction))
        
        let navImage = UIImageView(frame: navigationBar.bounds)
        navImage.image = #imageLiteral(resourceName: "nav_bg2")
        navigationBar.addSubview(navImage)
    }
    
    @objc func nextAction() {
        let vc = SecondViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
