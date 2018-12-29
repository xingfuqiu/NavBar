//
//  BaseViewController.swift
//  NavBar
//
//  Created by XingfuQiu on 2018/12/29.
//  Copyright © 2018 XingfuQiu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    /// 假 navigationBar 的背景
    let navColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    /// 是否展示毛玻璃效果
    let isTranslucent = false
    /// 假的NavigatoinBar
    lazy var navigationBar: UIView = self.lazyNavigationBar()
    /// 毛玻璃效果层
    private lazy var effectView: UIVisualEffectView = self.lazyEffectView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isTranslucent {
            navigationBar.backgroundColor = .clear
            navigationBar.addSubview(effectView)
            NSLayoutConstraint.activate([
                effectView.leftAnchor.constraint(equalTo: navigationBar.leftAnchor),
                effectView.topAnchor.constraint(equalTo: navigationBar.topAnchor),
                effectView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor),
                effectView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor)
                ])
        }
    }
    
    override func viewDidLayoutSubviews() {
        view.insertSubview(navigationBar, at: 0)
        view.bringSubviewToFront(navigationBar)
        navigationBar.bringSubviewToFront(effectView)
    }
}

extension BaseViewController {
    /// 假的 NavigationBar
    ///
    /// - Returns: 假 NavBar
    private func lazyNavigationBar() -> UIView {
        // 这里的高度根据实际机型动态调整,例如iPhone X和iOS11更新的大标题等等
        let navHeight: CGFloat
        if UIScreen.main.bounds.size.equalTo(CGSize(width: 375, height: 812)) || UIScreen.main.bounds.size.equalTo(CGSize(width: 414, height: 896)) {
            // 全面屏 iPhone X/Xs/XR/Xs Max
            navHeight = 88
        } else {
            // 非全面屏 iPhone
            navHeight = 64
        }
        
        let temp = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: navHeight))
        temp.backgroundColor = navColor
        // 还可以加其它自定义
        return temp
    }
    
    /// 毛玻璃效果View
    ///
    /// - Returns: 毛玻璃
    private func lazyEffectView() -> UIVisualEffectView {
        let effect = UIBlurEffect(style: .extraLight)
        let temp = UIVisualEffectView(effect: effect)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }
}
