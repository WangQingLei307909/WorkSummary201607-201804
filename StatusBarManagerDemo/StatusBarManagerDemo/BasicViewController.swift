//
//  BasicViewController.swift
//  StatusBarManagerDemo
//
//  Created by luhe liu on 2018/4/11.
//  Copyright © 2018年 com.liuting. All rights reserved.
//

import UIKit

/// 保证所有控制器都重载了 prefersStatusBarHidden 的方法
class BasicViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return StatusBarManager.shared.isHidden
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return StatusBarManager.shared.style
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return StatusBarManager.shared.animation
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
         StatusBarManager.shared.popState()
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        StatusBarManager.shared.pushState(with: "\(viewControllerToPresent)")
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: completion)
    }
}
