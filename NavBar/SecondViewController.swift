//
//  SecondViewController.swift
//  NavBar
//
//  Created by XingfuQiu on 2018/12/29.
//  Copyright © 2018 XingfuQiu. All rights reserved.
//

import UIKit

class SecondViewController: BaseViewController {
    fileprivate var statusBarShouldLight = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "透明"
        view.backgroundColor = UIColor.random
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(SecondViewController.nextAction))
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: -88),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    
        let navImage = UIImageView(frame: navigationBar.bounds)
        navImage.image = #imageLiteral(resourceName: "nav_bg2")
        navigationBar.addSubview(navImage)
        
//        navBarBgAlpha = 0
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if statusBarShouldLight {
            return .lightContent
        } else {
            return .default
        }
    }
    
    @objc func nextAction() {
        let vc = ThirdViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.navigationBar.tintColor = .white
//        let textAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
//        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1999762356, green: 0.200016588, blue: 0.1999709308, alpha: 1)
//        let textAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1999762356, green: 0.200016588, blue: 0.1999709308, alpha: 1)]
//        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    lazy var tableView: UITableView = {
        let tbl = UITableView()
        tbl.backgroundColor = .white
        tbl.dataSource = self
        tbl.delegate = self
        tbl.rowHeight = 44
        tbl.translatesAutoresizingMaskIntoConstraints = false
        
        let headerView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width * 0.65))
        headerView.contentMode = .scaleAspectFill
        headerView.image = UIImage(named: "a9a69883ba624e67")
        tbl.tableHeaderView = headerView
        
        view.addSubview(tbl)
        return tbl
    }()

}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CELL")
        }
        cell?.textLabel?.text = "我是列表...."
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var delta = scrollView.contentOffset.y / CGFloat(88) + 1
        delta = CGFloat.maximum(delta, 0)
        // 方案1
        navigationBar.alpha = CGFloat.minimum(delta, 1)
//        print(navigationBar.alpha)
        // 方案2
//        navBarBgAlpha = CGFloat.minimum(delta, 1)
//        statusBarShouldLight = CGFloat.minimum(delta, 1) < 1
//        print(navBarBgAlpha)
        
//        setNeedsStatusBarAppearanceUpdate()
    }
}
